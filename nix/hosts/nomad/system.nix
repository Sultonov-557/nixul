{ ... }:
{
  imports = [
    ../common/context.nix
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";
    location = "Urganch";
    bookmarks = { };
  };
}
