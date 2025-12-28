{ pkgs, user, ... }:

{
  imports = [
    ../../modules/system
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./audio.nix
  ];

  # User Configuration
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.11";
}
