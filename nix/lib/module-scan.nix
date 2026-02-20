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

  parseModuleDef =
    path:
    let
      segments = pathSegments path;
      definition = import path;
      meta = if builtins.isAttrs definition then definition.meta or { } else { };
      scope = meta.scope or "both";
      key = lib.concatStringsSep "." segments;
    in
    {
      inherit path segments definition scope key;
    };

  moduleDefs = map parseModuleDef allModuleFiles;

  autoModules = [ ];

  regularModuleImports = [ ];
in
{
  inherit moduleDefs autoModules regularModuleImports;
}
