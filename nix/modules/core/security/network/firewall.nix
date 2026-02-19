{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
      allowedUDPPorts = [ ];
    };
  };
}
