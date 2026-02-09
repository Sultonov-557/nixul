{ lib }:

let
  isNix = name: lib.hasSuffix ".nix" name;

  importTree =
    dir:
    let
      entries = builtins.readDir dir;

      hasDefault = (entries ? "default.nix") && entries."default.nix" == "regular";

      names = builtins.attrNames entries;

      # Import .nix files in this directory, except default.nix
      nixFiles = builtins.filter (
        name: entries.${name} == "regular" && isNix name && name != "default.nix"
      ) names;

      # Recurse into subdirectories
      subdirs = builtins.filter (name: entries.${name} == "directory") names;

      fromFiles = builtins.map (name: dir + "/${name}") nixFiles;
      fromDirs = builtins.concatMap (name: importTree (dir + "/${name}")) subdirs;
    in
    if hasDefault then [ (dir + "/default.nix") ] else fromFiles ++ fromDirs;
in
importTree
