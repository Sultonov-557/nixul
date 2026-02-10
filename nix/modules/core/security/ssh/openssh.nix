{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
    };

    listenAddresses = [
      {
        addr = "127.0.0.1";
        port = 22;
      }
      {
        addr = "192.168.3.36";
        port = 22;
      }
    ];
  };
}
