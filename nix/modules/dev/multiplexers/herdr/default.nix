{ lib, pkgs, inputs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.herdr
        pkgs.fzf
        pkgs.jq
      ];
    };

  home =
    { cfg, ... }:
    {
      xdg.configFile."herdr/config.toml" = lib.mkIf cfg.enable {
        source = ./config.toml;
      };

      # Command palette plugin (fzf-based fuzzy action picker)
      xdg.configFile."herdr/plugins/jt.command-palette" = lib.mkIf cfg.enable {
        source = inputs.herdr-command-palette;
        recursive = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable herdr terminal multiplexer";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
