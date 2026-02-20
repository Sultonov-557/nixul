{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      programs.nix-ld = {
        enable = true;
        libraries = [
          pkgs.jre8
          pkgs.temurin-jre-bin-17
          pkgs.cups
          pkgs.mesa
          pkgs.libdrm
          pkgs.glib
          pkgs.gtk3
          pkgs.gdk-pixbuf
          pkgs.pango
          pkgs.cairo
          pkgs.atk
          pkgs.at-spi2-atk
          pkgs.at-spi2-core
          pkgs.dbus
          pkgs.nss
          pkgs.nspr
          pkgs.libxkbcommon
          pkgs.alsa-lib
        ];
      };
    };
}
