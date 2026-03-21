{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      documentation = lib.mkIf cfg.enable {
        enable = true;
        dev.enable = true;
        doc.enable = true;
        info.enable = true;
        man.enable = true;
        nixos.enable = true;
      };
    };}
