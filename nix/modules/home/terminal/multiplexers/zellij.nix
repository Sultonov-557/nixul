{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.terminal.multiplexers.zellij;
in
{
  options.modules.terminal.multiplexers.zellij = {
    enable = lib.mkEnableOption "zellij";
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration = true;
    };

    xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
  };
}
