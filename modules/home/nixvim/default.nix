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
      ./plugins
    ];

    #Language Servers
    withNodeJs = true;
  };
}
