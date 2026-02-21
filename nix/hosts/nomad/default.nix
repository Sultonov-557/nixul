{ loadTags, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
  ]
  ++ loadTags [ "base" ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";

  };

}
