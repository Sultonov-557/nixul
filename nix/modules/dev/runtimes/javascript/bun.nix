{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.bun = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ bun ]);

      programs.nix-ld.libraries = lib.mkIf cfg.enable (with pkgs; [
        bun
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bun";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
