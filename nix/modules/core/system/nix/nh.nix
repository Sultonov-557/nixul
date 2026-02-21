{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.nh = lib.mkIf cfg.enable {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 14d --keep 10";
        flake = "${../../..}";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
