{
  lib,
  discovered,
  hostMods,
  userMods,
  mkNested,
  mergeAll,
}:
let
  mkMeta =
    module:
    let
      modulePath = lib.concatStringsSep "." module.pathParts;
      moduleScope =
        if module.hasSystem && module.hasHome then
          "shared"
        else if module.hasSystem then
          "system"
        else if module.hasHome then
          "home"
        else
          "data";

      defaults = {
        id = modulePath;
        name = lib.last module.pathParts;
        description = "Nixul module `${modulePath}`.";
        purpose = "Configure `${modulePath}` behaviour.";
        scope = moduleScope;
        domain = lib.head module.pathParts;
        status = "active";

        interfaces = {
          system = module.hasSystem;
          home = module.hasHome;
        };

        optionPaths = {
          host = if module.hasSystem then "nixul.host.modules.${modulePath}" else null;
          user = if module.hasHome then "nixul.users.<name>.modules.${modulePath}" else null;
        };

        file = toString module.filePath;
        tags = [ ];
        links = [ ];
        extra = { };
      };
    in
    lib.recursiveUpdate defaults module.metadata;

  mkTree = modules: mergeAll (map (module: mkNested module.pathParts (mkMeta module)) modules);
in
{
  allModuleMetadata = mkTree discovered;
  hostModuleMetadata = mkTree hostMods;
  userModuleMetadata = mkTree userMods;
}
