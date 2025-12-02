{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "sddm-macos-theme";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-light";
    rev = "master";
    sha256 = "sha256-KddZtCTionZntQPD8ttXhHFLZl8b1NsawG9qbjuI1fc=";
  };

  installPhase = ''
        mkdir -p $out/share/sddm/themes/macos
        cp -r * $out/share/sddm/themes/macos/

        cat > $out/share/sddm/themes/macos/theme.conf << EOF
    [General]
    Background="${../assets/wallpaper-light.jpg}"
    ScaleImageCropped=true
    FullBlur=true
    PartialBlur=false
    BlurRadius=20

    MainColor="#0A84FF"
    AccentColor="#0A84FF"
    BackgroundColor="#1E1E1E"
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
