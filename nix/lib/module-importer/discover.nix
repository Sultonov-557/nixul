{
  lib,
  modulesRoot,
  dirEntryFile,
  isNixFile,
  sanitizeParts,
  loadModule,
}:
let
  walk =
    dirPath: pathParts:
    let
      entries = builtins.readDir dirPath;
      defaultFile = dirEntryFile dirPath;

      mkEntry =
        parts: filePath:
        let
          loaded = loadModule filePath;
        in
        {
          pathParts = sanitizeParts parts;
          inherit (loaded)
            mod
            meta
            scope
            hm
            system
            ;
          inherit filePath;
        };
    in
    if defaultFile != null then
      [ (mkEntry pathParts defaultFile) ]
    else
      let
        names = builtins.attrNames entries;

        subdirs = lib.concatMap (
          name:
          if entries.${name} == "directory" then walk (dirPath + "/${name}") (pathParts ++ [ name ]) else [ ]
        ) names;

        nixFiles = lib.concatMap (
          name:
          if entries.${name} == "regular" && isNixFile name then
            let
              base = lib.removeSuffix ".nix" name;
              filePath = dirPath + "/${name}";
            in
            [ (mkEntry (pathParts ++ [ base ]) filePath) ]
          else
            [ ]
        ) names;
      in
      nixFiles ++ subdirs;

  discovered =
    let
      rootEntries = builtins.readDir modulesRoot;
      topNames = builtins.attrNames rootEntries;
    in
    lib.concatMap (
      name:
      if rootEntries.${name} == "directory" then
        walk (modulesRoot + "/${name}") [ name ]
      else if rootEntries.${name} == "regular" && isNixFile name then
        walk modulesRoot [ ]
      else
        [ ]
    ) topNames;

  hostMods = builtins.filter (m: m.scope == "host" && m.system) discovered;
  userMods = builtins.filter (m: m.scope == "user" && m.hm) discovered;
in
{
  inherit discovered hostMods userMods;
}
