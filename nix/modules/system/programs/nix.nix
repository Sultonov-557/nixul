{ pkgs, ... }: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${../..}";
  };

  environment.defaultPackages = with pkgs; [ deadnix ];

  nixpkgs.config = {
    allowUnfree = true;
    separateDebugInfo = false;
  };

  programs.nix-ld = {
    enable = true;
    libraries = [ pkgs.jre8 pkgs.temurin-jre-bin-17 pkgs.bun ];
  };

  environment.pathsToLink =
    [ "/share/applications" "/share/xdg-desktop-portal" ];

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    auto-optimise-store = true;
    keep-outputs = false;
    keep-derivations = false;

    experimental-features = [ "nix-command" "flakes" ];

    substituters = [
      "https://cache.nixos.org/"
      "https://nixpkgs.cachix.org"
      "https://hyprland.cachix.org"
      "https://niri.cachix.org"
    ];
    trusted-public-keys = [
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "niri:7kPRy+bwoMP2GiLMR20qHUUiQ1Tg96YapZFsyvokm90="
    ];
  };
}
