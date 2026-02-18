{ inputs, config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    imports = [ inputs.zen-browser.homeModules.default ];

    programs.zen-browser = {
      enable = true;

      profiles.default = {
        id = 0;
        isDefault = true;
        name = "Default";

        sine = {
          enable = true;
          mods = [ "Nebula" ];
        };
      };
    };
  };
}
