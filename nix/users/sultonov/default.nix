{ loadUserTags, ... }:
{
  nixul = {
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";
      modules = loadUserTags [ "base" ];
      keybinds = import ./keybinds;
      bookmarks = import ./bookmarks.nix;
    };
  };
}
