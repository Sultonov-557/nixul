{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.television = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  home =
    { cfg, ... }:
    {
      programs.television = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableBashIntegration = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fzf";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
