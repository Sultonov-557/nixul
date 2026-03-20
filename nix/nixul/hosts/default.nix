{ lib, ... }:
let
  keybindSubmodule = import ../keybinds/types/keybind.nix;
  bookmarkTypes = import ../universal/bookmarks/types { inherit lib; };
in
{
  options.nixul = {
    host = lib.mkOption {
      type = lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            description = "hostname of the machine";
          };
          timezone = lib.mkOption {
            type = lib.types.str;
            default = "UTC";
            description = "timezone of the machine";
          };
          location = lib.mkOption {
            type = lib.types.str;
            default = "The Moon";
            description = "location of the machine for weather etc...";
          };
          keybinds = lib.mkOption {
            type = lib.types.listOf keybindSubmodule;
            default = [ ];
            description = "list of keybinds";
          };
          bookmarks = lib.mkOption {
            type = lib.types.attrsOf bookmarkTypes.groupBookmarkType;
            default = { };
            description = "host-level bookmarks for dashboards (glance, dashy)";
          };
          modules = lib.mkOption {
            type = lib.types.attrsOf lib.types.attrs;
            default = { };
            description = "list of modules";
          };
          jsonExtractor = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkOption {
                  type = lib.types.bool;
                  default = true;
                  description = "enable json extraction helpers for nixul cli";
                };
                includeHostModules = lib.mkOption {
                  type = lib.types.bool;
                  default = true;
                  description = "include nixul.host.modules in extracted output";
                };
                includeUserModules = lib.mkOption {
                  type = lib.types.bool;
                  default = true;
                  description = "include nixul.users.<name>.modules in extracted output";
                };
                onlyEnabled = lib.mkOption {
                  type = lib.types.bool;
                  default = true;
                  description = "when true, only include module paths where enable = true";
                };
                output = lib.mkOption {
                  type = lib.types.enum [
                    "paths"
                    "tree"
                  ];
                  default = "paths";
                  description = "default json extractor output shape";
                };
              };
            };
            default = { };
            description = "config for nixul json extractor commands";
          };
        };
      };
    };
  };
}
