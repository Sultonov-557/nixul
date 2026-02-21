{ lib }:
let
  t = lib.types;
in
{
  mkCfgOption =
    module:
    lib.mkOption {
      type = t.nullOr (
        if module.options != null then
          t.submodule (_: {
            options = module.options;
          })
        else
          t.attrs
      );
      default = null;
      description = "Auto-imported nixul module: ${module.name}";
    };

  assertCfgType =
    {
      filePath,
      optName,
      cfg,
    }:
    if cfg == null || builtins.isAttrs cfg then
      cfg
    else
      throw ''
        nixul module importer: option must be null or an attrset

        Option: ${optName}
        File: ${toString filePath}
        Got type: ${builtins.typeOf cfg}
      '';
}
