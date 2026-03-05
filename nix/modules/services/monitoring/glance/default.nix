{ lib, config, ... }:
let
  mkBookmarks = import ../../../../nixul/universal/bookmarks/adapters/glance/default.nix { inherit lib; };
in
{
  system =
    { cfg, ... }:
    {
      imports = [
        (import ./settings.nix { inherit mkBookmarks config; })
      ];
      services.glance.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable glance";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
