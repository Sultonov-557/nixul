{ lib, pkgs, ... }:
{
  metadata = {
    name = "mesa";
    description = "Module for `hardware.units.gpu.mesa`.";
    purpose = "Configure `hardware.units.gpu.mesa` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "units"
      "gpu"
      "mesa"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        mesa
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable mesa";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
