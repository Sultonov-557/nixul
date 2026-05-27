{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.kilocode-cli ];
    };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [ pkgs.kilocode-cli ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable kilocode";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
