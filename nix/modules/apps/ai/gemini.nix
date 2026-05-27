{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.gemini-cli = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [ pkgs.gemini-cli ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gemini";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
