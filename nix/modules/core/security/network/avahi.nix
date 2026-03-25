{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.avahi = lib.mkIf cfg.enable {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable avahi";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
