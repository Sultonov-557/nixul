{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
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
}
