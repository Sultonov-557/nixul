{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { inputs, config, ... }:
    {
      home-manager.users.${config.nixul.primaryUser} = {
        imports = [ inputs.nixcord.homeModules.nixcord ];
        programs.nixcord = {
          enable = true;
        };
      };
    };
}
