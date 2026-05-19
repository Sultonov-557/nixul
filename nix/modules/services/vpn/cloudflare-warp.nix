{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ cloudflare-warp ]);

      services.cloudflare-warp = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ cloudflare-warp ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable cloudflare-warp";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
