{ inputs, config, ... }: {

  home-manager.users.${config.nixul.user} = { ... }: {
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = { enable = true; };
  };
}
