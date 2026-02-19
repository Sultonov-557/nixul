{ lib }:

let
  baseDir = ../modules;
  importTree = import ./import-tree.nix { inherit lib; };

  moduleDirs = [
    (baseDir + "/apps")
    (baseDir + "/core")
    (baseDir + "/desktop")
    (baseDir + "/dev")
    (baseDir + "/hardware")
    (baseDir + "/services")
  ];

  allModuleFiles = builtins.concatMap importTree moduleDirs;

  pathSegments =
    path:
    let
      relative = lib.removeSuffix ".nix" (lib.removePrefix "${toString baseDir}/" (toString path));
    in
    lib.splitString "/" relative;

  isModuleDefinition =
    path:
    let
      result = builtins.tryEval (import path);
    in
    path != toString (baseDir + "/default.nix")
    && result.success
    && builtins.isAttrs result.value
    && result.value ? meta;

  moduleDefPaths = builtins.filter isModuleDefinition allModuleFiles;

  parseModuleDef =
    path:
    let
      segments = pathSegments path;
      definition = import path;
      meta = definition.meta or { };
      scope = meta.scope or "both";
      hasSystem = meta.system or (definition ? system);
      hasHome = meta.hm or (definition ? home);
      key = lib.concatStringsSep "." segments;
    in
    {
      inherit path segments definition scope hasSystem hasHome key;
      isAuto = false;
    };

  moduleDefs = map parseModuleDef moduleDefPaths;

  autoModulePaths = builtins.filter (p: !builtins.elem p moduleDefPaths) allModuleFiles;

  parseAutoModule =
    path:
    let
      segments = pathSegments path;
      key = lib.concatStringsSep "." segments;
    in
    {
      inherit path segments key;
    };

  autoModules = map parseAutoModule autoModulePaths;

  regularModuleImports = builtins.filter (
    p: !(builtins.elem p moduleDefPaths) && !(builtins.elem p autoModulePaths)
  ) allModuleFiles;
in
{
  inherit moduleDefs autoModules regularModuleImports;
}
