{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.zellij = {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        attachExistingSession = true;
      };

      xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
    };
}
