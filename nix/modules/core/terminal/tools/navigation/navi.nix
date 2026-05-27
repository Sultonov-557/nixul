{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ navi ]);
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ navi ]);

      xdg.configFile = lib.mkIf cfg.enable {
        "navi/config.yaml".text = ''
          cheatsheet: https://github.com/cheat/cheatsheets
          cheatsheet: https://github.com/deniztraka/cheat_sh
          cheatsheet: https://github.com/ibraheemdev/modern-unix
          cheatsheet: https://github.com/sulami/navi-styles
          cheatsheet: https://github.com/0xalof/navi-cheatsheet
          cheatsheet: https://github.com/hartwork/navi-cheatsheet
        '';
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable navi";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
