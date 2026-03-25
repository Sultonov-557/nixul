{ lib, ... }:
{
  #TODO: system

  home =
    { cfg, ... }:
    {
      programs.ssh = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ssh";
        };
      };
    };
    default = {
      enable = false;
      serversSecretFile = null;
      strictHostKeyChecking = "accept-new";
    };
  };
}
