{ lib, pkgs, ... }:
{
  home =
    {
      cfg,
      inputs,
      nixul,
      ...
    }:
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

      programs.spicetify = lib.mkIf cfg.enable {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          shuffle
          hidePodcasts
          adblockify
        ];

        enabledCustomApps = with spicePkgs.apps; [ marketplace ];

        customColorScheme =
          let
            palette = nixul.theme.colors.palette;
          in
          {
            text = "${palette.base05}";
            subtext = "${palette.base04}";
            main = "${palette.base00}";
            sidebar = "${palette.base01}";
            player = "${palette.base01}";
            card = "${palette.base02}";
            shadow = "${palette.base00}";
            button = "${palette.base0D}";
            button-active = "${palette.base0E}";
            button-disabled = "${palette.base03}";
            tab-active = "${palette.base02}";
            notification = "${palette.base0D}";
            notification-error = "${palette.base08}";
            misc = "${palette.base0C}";
          };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable spicetify";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
