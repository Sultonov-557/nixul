{ lib, ... }:
{
  metadata = {
    name = "pipewire";
    description = "Module for `hardware.audio.pipewire`.";
    purpose = "Configure `hardware.audio.pipewire` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "audio"
      "pipewire"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.pipewire = lib.mkIf cfg.enable {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;

        wireplumber.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable pipewire";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
