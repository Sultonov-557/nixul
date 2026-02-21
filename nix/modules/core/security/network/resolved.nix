{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.resolved = lib.mkIf cfg.enable {
        enable = true;
        fallbackDns = [
          "127.0.0.1"
          "::1"
        ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable resolved";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
