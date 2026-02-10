{ ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22 # ssh
      80 # http
      443 # https
      3000 # Backend
    ];
    allowedUDPPorts = [
      22 # ssh
      80 # http
      443 # https
      3000 # Backend
    ];
  };

}
