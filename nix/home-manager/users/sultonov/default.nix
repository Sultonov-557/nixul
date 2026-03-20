{ ... }:
{
  imports = [
    ../../common/static-home-modules.nix
  ];

  home = {
    username = "sultonov";
    homeDirectory = "/home/sultonov";
    stateVersion = "26.05";
  };

  programs.nixvim.colorschemes.gruvbox.enable = true;
}
