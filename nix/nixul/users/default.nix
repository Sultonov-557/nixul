{ lib, ... }:
let
  keybindSubmodule = import ../universal/keybinds/types/keybind.nix { inherit lib; };
  bookmarkTypes = import ../universal/bookmarks/types { inherit lib; };
  userModule = import ../universal/users/modules/user.nix { inherit lib; };
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
              bookmarks = lib.mkOption {
                type = lib.types.attrsOf bookmarkTypes.groupBookmarkType;
                default = { };
                description = "user-level bookmarks for browsers";
              };
              modules = lib.mkOption {
                type = lib.types.attrsOf lib.types.attrs;
                default = { };
                description = "list of modules";
              };
              shell = lib.mkOption {
                type = lib.types.enum [
                  "bash"
                  "fish"
                  "zsh"
                ];
                default = "fish";
                description = "login shell for the user";
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
