{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.open-webui = lib.mkIf cfg.enable {
        enable = true;
        port = 9999;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable open-webui";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
