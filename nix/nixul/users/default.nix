{ lib, ... }:
let
  keybindSubmodule = import ../keybinds/types/keybind.nix;
in
{
  options.nixul = {
    primaryUser = lib.mkOption {
      type = lib.types.str;
      description = "primary user";
    };

    users = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }:
          {
            options = {
              enabled = lib.mkOption {
                type = lib.types.bool;
                default = true;
                description = "enable user";
              };
              name = lib.mkOption {
                type = lib.types.str;
                description = "username";
                default = name;
              };
              home = lib.mkOption {
                type = lib.types.str;
                description = "home directory";
                default = "/home/${name}";
              };
              email = lib.mkOption {
                type = lib.types.str;
                description = "email";
              };
              keybinds = lib.mkOption {
                type = lib.types.listOf keybindSubmodule;
                default = [ ];
                description = "list of keybinds";
              };
              tags = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ ];
                description = "list of tags";
              };
              modules = lib.mkOption {
                type = lib.types.attrsOf (lib.types.nullOr lib.types.attrs);
                default = { };
                description = "feature modules for the user";
              };
            };
          }
        )
      );
      default = { };
      description = "list of users";
    };
  };
}
