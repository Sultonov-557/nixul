{ lib, pkgs, ... }:
{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [ pkgs.cursor-cli ];
    };
}
