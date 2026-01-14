{ pkgs, ... }:

{
  home.packages = [
    (pkgs.via.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        substituteInPlace $out/share/applications/via.desktop \
          --replace "Exec=via" \
          "Exec=via --enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    }))
  ];
}
