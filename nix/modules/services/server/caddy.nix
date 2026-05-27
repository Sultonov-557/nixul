{
  lib,
  pkgs,
  ...
}:
{

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ caddy ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable caddy";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
