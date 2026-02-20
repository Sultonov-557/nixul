{ lib }:
let
  t = lib.types;
in
{
  mkCfgOption =
    fullName:
    lib.mkOption {
      type = t.nullOr t.attrs;
      default = null;
      description = "Auto-imported nixul module: ${fullName}";
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
