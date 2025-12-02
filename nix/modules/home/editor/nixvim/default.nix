{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    imports = [
      ./options.nix
      ./keymaps.nix
      ./plugins
    ];

    #Language Servers
    withNodeJs = true;
  };
}
