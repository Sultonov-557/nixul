{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "sddm-macos-theme";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-light";
    rev = "master";
    sha256 = "sha256-Kdd2tCTion2ntQPD8ttXhHFL218b1NsawG9qbjuI1fc=";
  };

  installPhase = ''
        mkdir -p $out/share/sddm/themes/macos
        cp -r * $out/share/sddm/themes/macos/
        
        cat > $out/share/sddm/themes/macos/theme.conf << EOF
    [General]
    Background="${../assets/wallpaper.jpg}"
    ScaleImageCropped=true
    FullBlur=true
    PartialBlur=false
    BlurRadius=20

    MainColor="#007AFF"
    AccentColor="#007AFF"
    BackgroundColor="#F5F5F5"
    OverrideLoginButtonTextColor="#FFFFFF"

    Font="Inter"
    FontSize=11

    ForceRightToLeft=false

    WelcomeText=Welcome to macOS-style NixOS
    PasswordFieldPlaceholderText=Password
    ShowPasswordVisibilityButton=true

    SessionsFontSize=10
    ShowSessionsByDefault=false

    HeaderText=
    EOF
  '';

  meta = {
    description = "macOS-style SDDM theme";
    platforms = pkgs.lib.platforms.linux;
  };
}
