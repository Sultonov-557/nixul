{ lib, ... }:
{
  options.nixul.aliases = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };
}
