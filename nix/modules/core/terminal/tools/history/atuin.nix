{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.atuin = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        settings = {
          auto_sync = true;
          sync_frequency = "10m";
          search_mode = "fuzzy";
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable atuin";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
