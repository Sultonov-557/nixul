{ pkgs, config, ... }:

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
  users.users.${config.nixul.user} = {
    isNormalUser = true;
    description = config.nixul.user;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.11";
}
