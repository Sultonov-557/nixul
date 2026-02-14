{ lib }:

{
  mkBoolModule =
    config: path: configBlock:
    let
      fullPath = [ "nixul" ] ++ path;
      enabled = lib.attrByPath fullPath false config;
    in
    {
      options = lib.setAttrByPath fullPath (
        lib.mkOption {
          type = lib.types.bool;
          default = false;
        }
      );

      config = lib.mkIf enabled configBlock;
    };
}
