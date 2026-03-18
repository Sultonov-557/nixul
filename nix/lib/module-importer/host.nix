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
          defaultCfg =
            if module.options != null && (module.options._type or null) == "option" then
              (module.options.default or { })
            else
              { };

          cfg0 = (
            lib.attrByPath (
              [
                "nixul"
                "host"
                "modules"
              ]
              ++ module.pathParts
            ) defaultCfg config
          );
          cfgChecked = assertCfgType {
            filePath = module.filePath;
            inherit optName;
            cfg = cfg0;
            inherit module;
          };

          defaultEnable = defaultCfg.enable or false;

          cfg =
            if cfgChecked == null then
              { enable = defaultEnable; }
            else if builtins.isAttrs cfgChecked && !(cfgChecked ? enable) then
              cfgChecked // { enable = defaultEnable; }
            else
              cfgChecked;

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
              nixul = config.nixul;
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
