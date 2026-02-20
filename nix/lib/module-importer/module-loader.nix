{
  lib,
  pkgs,
  inputs,
}:
let
  toPretty = lib.generators.toPretty { };

  importValue =
    filePath:
    let
      imported = builtins.tryEval (import filePath);
    in
    if imported.success then
      imported.value
    else
      throw ''
        nixul module importer: failed to import file

        File: ${toString filePath}
      '';

  materialize =
    filePath:
    let
      raw = importValue filePath;
      mod = if builtins.isFunction raw then raw { inherit lib pkgs inputs; } else raw;
      evaluated = builtins.tryEval mod;
    in
    if evaluated.success then
      evaluated.value
    else
      throw ''
        nixul module importer: module evaluation failed

        File: ${toString filePath}
      '';

  validateContract =
    {
      filePath,
      mod,
    }:
    if !(builtins.isAttrs mod) then
      throw ''
        nixul module importer: module must return an attrset

        File: ${toString filePath}
        Type: ${builtins.typeOf mod}
      ''
    else
      let
        meta = mod.meta or null;
        scope = if meta != null then (meta.scope or null) else null;
        hm = if meta != null then (meta.hm or false) else false;
        system = if meta != null then (meta.system or false) else false;

        metaError =
          if meta == null then
            "meta is missing"
          else if !builtins.isAttrs meta then
            "meta must be an attrset"
          else if !(scope == "host" || scope == "user") then
            "meta.scope must be host or user"
          else if hm && !(mod ? home) then
            "meta.hm is true but home is missing"
          else if system && !(mod ? system) then
            "meta.system is true but system is missing"
          else
            null;
      in
      if metaError != null then
        throw ''
          nixul module importer: invalid module contract

          File: ${toString filePath}
          Issue: ${metaError}
          meta: ${toPretty meta}
          has home: ${toString (mod ? home)}
          has system: ${toString (mod ? system)}
        ''
      else
        {
          inherit
            mod
            meta
            scope
            hm
            system
            ;
        };
in
{
  loadModule =
    filePath:
    let
      mod = materialize filePath;
    in
    validateContract { inherit filePath mod; };
}
