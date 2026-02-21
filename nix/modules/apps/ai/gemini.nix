{ lib, ... }:
{

  home =
    { cfg, ... }:
    {
      programs.gemini-cli = lib.mkIf cfg.enable {
        enable = true;
        settings = { };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gemini";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
