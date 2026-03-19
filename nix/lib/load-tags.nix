{ lib, ... }:
let
  tagsRoot = ../nixul/tags/host;
  userTagsRoot = ../nixul/tags/user;
  modulesRoot = ../modules;

  listNixFiles =
    dir:
    lib.concatLists (
      lib.mapAttrsToList (
        name: kind:
        let
          child = dir + "/${name}";
        in
        if kind == "directory" then
          listNixFiles child
        else if kind == "regular" && lib.hasSuffix ".nix" name then
          [ child ]
        else
          [ ]
      ) (builtins.readDir dir)
    );

  moduleTags =
    map (
      file:
      let
        relative = lib.removePrefix "${toString modulesRoot}/" (toString file);
        tag = lib.removeSuffix ".nix" relative;
      in
      tag
    ) (builtins.filter (
      file:
      let
        relative = lib.removePrefix "${toString modulesRoot}/" (toString file);
      in
      relative != "default.nix" && !(lib.hasSuffix "/default.nix" relative)
    ) (listNixFiles modulesRoot));

  isModuleTag = tag: builtins.elem tag moduleTags;

  mkModuleTag =
    tag: lib.setAttrByPath ((lib.splitString "/" tag) ++ [ "enable" ]) true;

  loadTag =
    tag:
    let
      p = tagsRoot + "/${tag}.nix";
    in
    if builtins.pathExists p then
      import p
    else if isModuleTag tag then
      mkModuleTag tag
    else
      throw "nixul: unknown host tag '${tag}' (expected ${toString p} or a moduleTag path from nix/modules/**)";

  loadUserTag =
    tag:
    let
      p = userTagsRoot + "/${tag}.nix";
    in
    if builtins.pathExists p then
      import p
    else if isModuleTag tag then
      mkModuleTag tag
    else
      throw "nixul: unknown user tag '${tag}' (expected ${toString p} or a moduleTag path from nix/modules/**)";

  merge = lib.foldl' lib.recursiveUpdate { };

  loadTags = tags: merge (map loadTag tags);

  loadUserTags = tags: merge (map loadUserTag tags);

in
{
  inherit loadTags loadUserTags;
}
