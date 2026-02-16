{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      jre8
      temurin-jre-bin-17
      cups
      mesa
      libdrm
      glib
      gtk3
      gdk-pixbuf
      pango
      cairo
      atk
      at-spi2-atk
      at-spi2-core
      dbus
      nss
      nspr
      libdrm
      mesa
      libxkbcommon
      alsa-lib
    ];
  };
}
