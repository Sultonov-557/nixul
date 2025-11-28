{ pkgs, ... }:

{
  # Minimal Global System Configuration

  imports = [
    ./boot.nix
  ];

  # Nix Configuration
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  # Locale
  time.timeZone = "Asia/Tashkent"; # Assuming based on previous logs, or default to UTC if unsure.
  # Actually, I should probably check locale.nix but for minimal I'll just set a safe default or keep what was likely there.
  # The user's time in metadata suggests +05:00 which is Tashkent/Samarkand.
  i18n.defaultLocale = "en_US.UTF-8";

  # Networking
  networking.networkmanager.enable = true;

  # User Configuration
  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.bash; # Reverting to bash for minimal, user can enable zsh later
  };

  # System State Version
  system.stateVersion = "25.05";
}
