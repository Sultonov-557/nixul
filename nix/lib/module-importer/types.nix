{ lib }:
let
  t = lib.types;

  mkCfgOption =
    module:
    let
      moduleOptions = module.options;
    in
    if moduleOptions == null then
      lib.mkOption {
        type = t.nullOr t.attrs;
        default = { };
        description = "Auto-imported nixul module: ${module.name}";
      }
    else if (moduleOptions._type or null) == "option" then
      moduleOptions
    else
      lib.mkOption {
        type = t.nullOr (t.submodule (_: { options = moduleOptions; }));
        default = { };
        description = "Auto-imported nixul module: ${module.name}";
      };

  assertCfgType =
    {
      filePath,
      optName,
      cfg,
      module,
    }:
    if !(cfg == null || builtins.isAttrs cfg) then
      throw ''
        nixul module importer: option must be null or an attrset

        Option: ${optName}
        File: ${toString filePath}
        Got type: ${builtins.typeOf cfg}
      ''
    else if module.options == null then
      cfg
    else if (module.options._type or null) == "option" then
      let
        optionType = module.options.type or null;
      in
      if optionType != null && (optionType.check cfg) then
        cfg
      else
        throw ''
          nixul module importer: option value failed type check

          Option: ${optName}
          File: ${toString filePath}
          Got type: ${builtins.typeOf cfg}
        ''
    else
      cfg;
in
{
  inherit mkCfgOption assertCfgType;
}
