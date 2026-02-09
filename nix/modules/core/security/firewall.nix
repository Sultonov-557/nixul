{ ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      3000
    ];
    allowedUDPPorts = [
      80
      443
      3000
    ];
  };

}
