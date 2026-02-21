{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.pay-respects = lib.mkIf cfg.enable {
        enable = true;
        options = [
          "--alias"
          "f"
        ];
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable thefuck (pay-respects)";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
