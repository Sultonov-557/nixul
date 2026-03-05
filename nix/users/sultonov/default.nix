{ loadUserTags, lib, ... }:
{
  nixul = {
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";

      keybinds = import ./keybinds;
      bookmarks = import ./bookmarks.nix;

      modules =
        lib.recursiveUpdate
          (loadUserTags [
            "cli/base"
            "cli/zsh"
            "dev/neovim"
            "git/base"
          ])
          {
            modules.dev.editor.nixvim.enable = true;
          };
    };
  };
}
