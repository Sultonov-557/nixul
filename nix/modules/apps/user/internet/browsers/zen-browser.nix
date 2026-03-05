{ lib, config, ... }:
let
  mkBookmarks = import ../../../../../nixul/universal/bookmarks/adapters/browsers/default.nix { inherit lib; };
in
{
  home =
    { cfg, inputs, user, ... }:
    {
      imports = [ inputs.zen-browser.homeModules.default ];

      programs.zen-browser = lib.mkIf cfg.enable {
        enable = true;

        profiles.default = {
          id = 0;
          isDefault = true;
          name = "Default";

          bookmarks = mkBookmarks config.nixul.users.${user}.bookmarks;

          sine = {
            enable = true;
            mods = [ "Nebula" ];
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zen-browser";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}

