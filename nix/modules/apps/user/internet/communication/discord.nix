{ inputs, config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    imports = [ inputs.nixcord.homeModules.nixcord ];
    programs.nixcord = {
      enable = true;
    };
  };
}
