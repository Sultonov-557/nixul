{
  lib,
  config,
  inputs,
  ...
}:
let
  theme = config.nixul.theme;
in
{
  system =
    { ... }:
    {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = inputs.nix-colors.colorSchemes.${theme.colors.scheme};

        targets = {
        };

        cursor = theme.cursor;

        opacity = theme.opacity;

        icons = {
          enable = true;
          package = theme.icons.package;
          dark = theme.icons.name;
          light = theme.icons.name;
        };

        fonts = {
          monospace = {
            package = theme.fonts.monospace.package;
            name = theme.fonts.monospace.name;
          };
          sansSerif = {
            package = theme.fonts.sansSerif.package;
            name = theme.fonts.sansSerif.name;
          };
          serif = {
            package = theme.fonts.serif.package;
            name = theme.fonts.serif.name;
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable universal theming";
        };
      };
    };
    default = {
      enable = true;
    };
  };
}
