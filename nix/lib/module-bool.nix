{ lib }:

let
  resolveEnabled =
    { nixulDefaults, path }:
    let
      defaultValue = nixulDefaults.enableAllModules or false;
      override = lib.attrByPath path null nixulDefaults;
    in
    if override == null then defaultValue else override;
in
{
  mkBoolModule =
    {
      nixulDefaults,
      path,
    }:
    let
      fullPath = [ "nixul" ] ++ path;
      enabled = resolveEnabled { inherit nixulDefaults path; };
      options = lib.setAttrByPath fullPath (
        lib.mkOption {
          type = lib.types.nullOr lib.types.bool;
          default = false;
        }
      );
    in
    {
      inherit enabled options;
    };
}
