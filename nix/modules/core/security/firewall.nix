{ ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
      3000
    ];
    allowedUDPPorts = [
      22
      80
      443
      3000
    ];
  };

}
