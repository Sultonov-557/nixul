{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [ bun ];

  home-manager.users.${config.nixul.user} = {
    programs.bun = {
      enable = true;
    };
  };

  programs.nix-ld.libraries = with pkgs; [
    bun
  ];
}
