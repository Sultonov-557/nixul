{ lib, ... }:
{
  home =
    { cfg, config, ... }:
    let
      palette = config.nixul.theme.colors.palette;
    in
    {
      services.mako = lib.mkIf cfg.enable {
        enable = true;

        font = "${config.nixul.theme.fonts.sansSerif.name} ${toString config.nixul.theme.fonts.sansSerif.size}";
        backgroundColor = "#${palette.base00}";
        textColor = "#${palette.base05}";
        borderColor = "#${palette.base0D}";
        progressColor = "over #${palette.base02}";

        settings = {
          border-radius = 10;
          border-size = 2;
          width = 350;
          height = 100;
          margin = "10";
          padding = "15";
          default-timeout = 5000;
          anchor = "top-right";
          layer = "overlay";
        };

        extraConfig = ''
          [urgency=high]
          border-color=#${palette.base08}
          default-timeout=0
        '';
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable mako";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
