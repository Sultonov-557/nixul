{ ... }:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${../..}";
  };

  nixpkgs.config = {
    allowUnfree = true;
    separateDebugInfo = false;
  };

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    auto-optimise-store = true;
    keep-outputs = false;
    keep-derivations = false;

    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [
      "https://cache.nixos.org/"
      "https://nixpkgs.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:ZFI3rT84a1xr0EJ4yqVRK6p+Kx2HuhVE3rVb9VQwC5k="
      "niri:7kPRy+bwoMP2GiLMR20qHUUiQ1Tg96YapZFsyvokm90="
    ];

  };

}
