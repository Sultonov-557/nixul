{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.zellij = lib.mkIf cfg.enable {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        attachExistingSession = true;
      };

      xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
    };
}
