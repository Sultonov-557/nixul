{ lib, pkgs, ... }:
{

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ kdePackages.kdeconnect-kde ]);
      programs.kdeconnect.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ kdePackages.kdeconnect-kde ]);
      services.kdeconnect.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable KDE Connect";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
