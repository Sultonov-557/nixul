{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      home-manager.users.${config.nixul.primaryUser} = {
        programs.atuin = {
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;

          settings = {
            auto_sync = true;
            sync_frequency = "10m";
            search_mode = "fuzzy";
          };
        };
      };
    };
}
