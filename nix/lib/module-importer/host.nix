{
  lib,
  hostMods,
  assertCfgType,
  ...
}:
let
  evaluateHostModule =
    module:
    let
      modPath = (lib.concatStringsSep "." module.pathParts);
      sysVal = module.mod.system;
      sysType = builtins.typeOf sysVal;
      optName = "nixul.host.modules." + lib.concatStringsSep "." module.pathParts;
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
          inputs,
          ...
        }:
        let

          cfg0 = (
            lib.attrByPath (
              [
                "nixul"
                "host"
                "modules"
              ]
              ++ module.pathParts
            ) (module.options.default or { }) config
          );
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

          evaluated = (
            builtins.tryEval (sysVal {
              inherit
                lib
                pkgs
                config
                inputs
                ;
              cfg = cfg;
            })
          );
        in
        if evaluated.success then
          evaluated.value
        else
          throw ''
            nixul importer: evaluating system failed

            Module: ${modPath}
            File: ${toString module.filePath}
          ''
      );

  hostImports = map evaluateHostModule hostMods;
in
{
  inherit hostImports;
}
