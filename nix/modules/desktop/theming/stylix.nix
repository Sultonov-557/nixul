{
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  home-manager.users.${config.nixul.user} = {
    stylix.targets = {
      nixvim = {
        enable = false;
      };
    };
  };

  stylix = {
    enable = true;
  };
}
