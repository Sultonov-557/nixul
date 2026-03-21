{ ... }:
{
  imports = [
    ../common/context.nix
  ];

  nixul.host = {
    name = "vanguard";
    timezone = "Asia/Tashkent";
    location = "Tashkent";
    bookmarks = { };
  };
}
