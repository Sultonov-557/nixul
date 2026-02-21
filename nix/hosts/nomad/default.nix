{ loadTags, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";
    modules = loadTags [ "base" ];
  };
}
