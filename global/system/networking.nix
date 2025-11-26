{ ... }:

{
  # Networking Configuration

  networking.networkmanager.enable = true;

  # Firewall configuration
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [
    80
    443
  ];
}
