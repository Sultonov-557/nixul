{ lib, ... }:
{
  system =
    {
      cfg,
      inputs,
      ...
    }:
    {
      imports = [
        inputs.ambxst.nixosModules.default
      ];

      programs.ambxst = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ambxst";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
