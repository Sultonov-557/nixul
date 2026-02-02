{ inputs, config, ... }: {

  home-manager.users.${config.nixul.user} = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      enable = true;
      extraSpecialArgs = { inherit inputs; };
      defaultEditor = true;
      enableMan = true;
      imports = [ ./options.nix ./keymaps.nix ./plugins ];

      colorschemes.gruvbox = {
        enable = true;
        settings = { transparent_background = true; };
      };

      #Language Servers
      withNodeJs = true;
    };
  };
}
