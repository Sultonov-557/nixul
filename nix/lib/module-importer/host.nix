{
  lib,
  hostMods,
  getByPathOrNull,
  assertCfgType,
  ...
}:
let
  config._module.args.nixulHostCfg = lib.attrByPath [
    "nixul"
    "host"
    "modules"
  ] { } config;
  nixulHostCfg = config._module.args.nixulHostCfg or { };

  evaluateHostModule =
    module:
    let
      modPath = lib.concatStringsSep "." module.pathParts;
      sysVal = module.mod.system;
      sysType = builtins.typeOf sysVal;
    in
    if !(builtins.isFunction sysVal) then
      throw ''
        nixul importer: module has meta.system=true but `system` is not a function

        Module: ${modPath}
        File: ${toString module.filePath}
        system type: ${sysType}
      ''
    else
      (
        {
          lib,
          pkgs,
          config,
          ...
        }:
        let
          optName = "nixul.modules." + lib.concatStringsSep "." module.pathParts;

          cfg0 = getByPathOrNull module.pathParts (nixulHostCfg);
          cfg = assertCfgType {
            filePath = module.filePath;
            inherit optName;
            cfg = cfg0;
          };

          _ = builtins.trace (
            "nixul importer: "
            + modPath
            + " cfg="
            + (if cfg == null then "null" else "set")
            + " file="
            + toString module.filePath
          ) null;

          evaluated =
            if cfg == null then
              {
                success = true;
                value = { };
              }
            else
              builtins.tryEval (sysVal {
                inherit lib pkgs config;
                cfg = cfg;
              });
        in
        if cfg == null then
          { }
        else if evaluated.success then
          evaluated.value
        else
          throw ''
            nixul importer: evaluating system failed

            Module: ${modPath}
            File: ${toString module.filePath}
          ''
      );

  hostImports = map evaluateHostModule hostMods;
  hostMerged = { };
in
{
  inherit hostImports hostMerged;
}
