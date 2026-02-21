{ lib, ... }:
let
  keybindSubmodule = import ../keybinds/types/keybind.nix;
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
          modules = lib.mkOption {
            type = lib.types.attrsOf lib.types.attrs;
            default = { };
            description = "list of modules";
          };
        };
      };
    };
  };
}
