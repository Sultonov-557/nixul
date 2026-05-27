{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ nix-melt ]);
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ vulnix ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nix-melt";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
