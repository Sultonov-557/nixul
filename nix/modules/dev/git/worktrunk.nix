{ lib, inputs, ... }:
{
  home =
    { cfg, ... }:
    {
      imports = [ inputs.worktrunk.homeModules.default ];

      programs.worktrunk = lib.mkIf cfg.enable {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable worktrunk";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
