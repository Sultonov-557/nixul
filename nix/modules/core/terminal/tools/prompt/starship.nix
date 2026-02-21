{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.starship = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        settings = {
          add_newline = false;
          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[➜](bold red)";
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable starship";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
