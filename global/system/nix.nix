{
  lib,
  config,
  pkgs,
  ...
}:

{
  # Nix Configuration

  # Session variables for flatpak integration
  environment.sessionVariables = {
    XDG_DATA_DIRS = lib.mkAfter [
      "/var/lib/flatpak/exports/share"
      "${config.users.users.sultonov.home}/.local/share/flatpak/exports/share"
    ];
    PATH = [ "$HOME/.cache/.bun/bin" ];
  };

  # nix-ld for running unpatched binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    nodePackages_latest.nodejs
    bun
  ];

  # nh - Nix helper tool
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/sultonov/nixos2";
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
      "https://hyprland.cachix.org"
      "https://cache.nix.m7.rs"
    ];

    trusted-public-keys = [
      "hyprland.cachix.org-1:ZFI3rT84a1xr0EJ4yqVRK6p+Kx2HuhVE3rVb9VQwC5k="
      "niri:7kPRy+bwoMP2GiLMR20qHUUiQ1Tg96YapZFsyvokm90="
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    separateDebugInfo = false;
  };
}
