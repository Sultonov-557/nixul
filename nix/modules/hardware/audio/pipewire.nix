{ lib, ... }:
{
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
    };}
