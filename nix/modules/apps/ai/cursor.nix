{ lib, ... }:
{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { cfg, pkgs, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.cursor-cli ];
    };
}
