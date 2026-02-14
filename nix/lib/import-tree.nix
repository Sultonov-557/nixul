{ lib }:

let
  isNix = name: lib.hasSuffix ".nix" name;

  wrapModule =
    { path, modulePath }:
    args@{ nixul, nixulDefaults ? { }, pkgs, ... }:
    let
      module = import path;
      boolModule = nixul.mkBoolModule {
        inherit nixulDefaults;
        path = modulePath;
      };
      moduleValue = if lib.isFunction module then module args else module;
      imports = moduleValue.imports or [ ];
      options = boolModule.options // (moduleValue.options or { });
      config =
        lib.mkIf boolModule.enabled (removeAttrs (moduleValue.config or moduleValue) [ "imports" "options" ]);
    in
    {
      inherit imports options config;
    };

  importTree =
    { dir, prefix }:
    let
      entries = builtins.readDir dir;

      hasDefault = (entries ? "default.nix") && entries."default.nix" == "regular";

      names = builtins.attrNames entries;

      nixFiles = builtins.filter (
        name: entries.${name} == "regular" && isNix name && name != "default.nix"
      ) names;

      subdirs = builtins.filter (name: entries.${name} == "directory") names;

      fromFiles = builtins.map (
        name:
        wrapModule {
          path = dir + "/${name}";
          modulePath = prefix ++ [ (lib.removeSuffix ".nix" name) ];
        }
      ) nixFiles;

      fromDirs = builtins.concatMap (
        name:
        importTree {
          dir = dir + "/${name}";
          prefix = prefix ++ [ name ];
        }
      ) subdirs;
    in
    if hasDefault then
      [
        (wrapModule {
          path = dir + "/default.nix";
          modulePath = prefix;
        })
      ]
    else
      fromFiles ++ fromDirs;
in
importTree
