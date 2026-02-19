{ config, lib, ... }:
{

  services.open-webui = {
    enable = true;
    port = 9999;
  };
}
