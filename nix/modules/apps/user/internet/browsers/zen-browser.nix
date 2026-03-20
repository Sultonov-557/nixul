{ lib, config, ... }:
let
  mkBookmarks = import ../../../../../nixul/universal/bookmarks/adapters/browsers/default.nix { inherit lib; };
in
{
  metadata = {
    name = "zen-browser";
    description = "Module for `apps.user.internet.browsers.zen-browser`.";
    purpose = "Configure `apps.user.internet.browsers.zen-browser` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "user"
      "internet"
      "browsers"
    ];
  };

  home =
    { cfg, inputs, user, nixul, ... }:
    {
      imports = [ inputs.zen-browser.homeModules.default ];

      programs.zen-browser = lib.mkIf cfg.enable {
        enable = true;

        profiles.default = {
          id = 0;
          isDefault = true;
          name = "Default";

          bookmarks = {
            force = true;
            settings = mkBookmarks nixul.users.${user}.bookmarks;
          };

          settings = {
            "ui.systemUsesDarkTheme" = 1;
            "layout.css.prefers-color-scheme.content-override" = 0;
            "browser.theme.content-theme" = 0;
            "browser.theme.toolbar-theme" = 0;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          };

          userChrome =
            let
              palette = nixul.theme.colors.palette;
            in
            ''
              :root {
                --zen-primary-color: #${palette.base0D} !important;
                --zen-secondary-color: #${palette.base0E} !important;
              }
            '';

          sine = {
            enable = true;
            mods = [ "Nebula" ];
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
          description = "Enable zen-browser";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
