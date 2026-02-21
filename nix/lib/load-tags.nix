{ lib, ... }:
let
  tagsRoot = ../nixul/tags/host;
  userTagsRoot = ../nixul/tags/user;

  loadTag =
    tag:
    let
      p = tagsRoot + "/${tag}.nix";
    in
    if builtins.pathExists p then
      import p
    else
      throw "nixul: unknown tag '${tag}' (expected ${toString p})";

  loadUserTag =
    tag:
    let
      p = builtins.trace "user tag path" userTagsRoot + "/${tag}.nix";
    in
    if builtins.pathExists p then
      import p
    else
      throw "nixul: unknown tag '${tag}' (expected ${toString p})";

  merge = lib.foldl' lib.recursiveUpdate { };

  loadTags = tags: merge (map loadTag tags);

  loadUserTags = tags: merge (map loadUserTag tags);

in
{
  inherit loadTags loadUserTags;
}
