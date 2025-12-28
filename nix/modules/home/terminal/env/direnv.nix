{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.terminal.env.direnv;
in
{
  options.modules.terminal.env.direnv = {
    enable = lib.mkEnableOption "direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
