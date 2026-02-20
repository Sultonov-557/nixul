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
        programs.pay-respects = {
          enable = true;
          options = [
            "--alias"
            "f"
          ];
          enableZshIntegration = true;
          enableFishIntegration = true;
        };
      };
    };
}
