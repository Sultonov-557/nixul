{ pkgs, ... }:

{
  home.sessionVariables = {
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"; # lets flatpak work
  };
  services.flatpak = {
    enable = true;
  };

  programs.xmcl = {
    enable = true;
    commandLineArgs = [
      "--password-store=\"gnome-libsecret\""
    ];
    jres = [
      pkgs.jre8
      pkgs.temurin-jre-bin-17
    ];
  };

  home.packages = with pkgs; [
    flatpak
    wineWowPackages.stable
    winetricks
    lutris
    dxvk
    vkd3d
  ];

}
