{
  lib,
  inputs,
  ...
}:
{
  home =
    { cfg, ... }:
    {
      imports = [ inputs.pi.homeModules.default ];

      programs.pi.coding-agent = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  system =
    { cfg, ... }:
    {
      imports = [ inputs.pi.nixosModules.default ];

      programs.pi.coding-agent = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable pi agent";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
