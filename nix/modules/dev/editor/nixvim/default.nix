{ inputs, config, ... }:
{

  home-manager.users.${config.nixul.user} = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      enable = true;
      extraSpecialArgs = { inherit inputs; };
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
  };
}
