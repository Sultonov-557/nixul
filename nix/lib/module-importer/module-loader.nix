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
        hasHome = mod ? home;
        hasSystem = mod ? system;
        options = mod.options or null;

      in
      {
        inherit
          mod
          options
          hasHome
          hasSystem
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
