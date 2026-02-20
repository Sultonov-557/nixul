{ lib }:
{
  isNixFile = name: lib.hasSuffix ".nix" name;
  mkNested = path: value: lib.setAttrByPath path value;
  mergeAll = xs: lib.foldl' lib.recursiveUpdate { } xs;
  getByPathOrNull = path: set: lib.attrByPath path null set;
  dirEntryFile =
    dirPath:
    let
      entries = builtins.readDir dirPath;
    in
    if entries ? "default.nix" && entries."default.nix" == "regular" then
      dirPath + "/default.nix"
    else
      null;
  sanitizeParts = parts: parts;
}
