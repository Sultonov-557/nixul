{ lib, inputs, ... }:
{
  home =
    { cfg, osConfig, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
        ./plugins.nix
        ./settings/audio.nix
        ./settings/bar.nix
        ./settings/brightness.nix
        ./settings/control-center.nix
        ./settings/desktop-widgets.nix
        ./settings/dock.nix
        ./settings/general.nix
        ./settings/hooks.nix
        ./settings/launcher.nix
        ./settings/locale.nix
        ./settings/network.nix
        ./settings/night-light.nix
        ./settings/notifications.nix
        ./settings/osd.nix
        ./settings/session-menu.nix
        ./settings/system-monitor.nix
        ./settings/templates.nix
        ./settings/ui.nix
        ./settings/wallpaper.nix
      ];

      programs.noctalia-shell = lib.mkIf cfg.enable {
        enable = true;
        systemd.enable = true;

        colors =
          let
            palette = osConfig.nixul.theme.colors.palette;
          in
          {
            mPrimary = "#${palette.base0D}";
            mOnPrimary = "#${palette.base00}";
            mSecondary = "#${palette.base0C}";
            mOnSecondary = "#${palette.base00}";
            mTertiary = "#${palette.base0E}";
            mOnTertiary = "#${palette.base00}";
            mSurface = "#${palette.base00}";
            mOnSurface = "#${palette.base05}";
            mSurfaceVariant = "#${palette.base01}";
            mOnSurfaceVariant = "#${palette.base04}";
            mOutline = "#${palette.base03}";
            mShadow = "#000000";
            mError = "#${palette.base08}";
            mOnError = "#${palette.base00}";
            mHover = "#${palette.base02}";
            mOnHover = "#${palette.base07}";
          };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable noctalia";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
