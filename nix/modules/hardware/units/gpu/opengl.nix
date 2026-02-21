{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.graphics = lib.mkIf cfg.enable {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          intel-compute-runtime
        ];
      };

      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        libGL
        libGLU
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable opengl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
