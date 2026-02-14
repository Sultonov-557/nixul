{ ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22 # ssh
      80 # http
      443 # https
      9999 # open-webui
    ];
    allowedUDPPorts = [ ];
  };
}
