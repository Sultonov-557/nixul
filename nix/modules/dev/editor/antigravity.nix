{ pkgs, ... }:

{
  environment.defaultPackages = [
    (pkgs.antigravity.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        if [ -f "$out/share/applications/antigravity.desktop" ]; then
          substituteInPlace "$out/share/applications/antigravity.desktop" \
            --replace "Exec=antigravity" \
            "Exec=antigravity --enable-features=UseOzonePlatform --ozone-platform=wayland"
        fi
      '';
    }))
  ];
}
