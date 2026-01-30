{ ... }: {
  # Networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 3000 ];
  networking.firewall.allowedUDPPorts = [ 80 443 3000 ];

}
