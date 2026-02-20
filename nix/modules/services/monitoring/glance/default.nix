{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    imports = [
      ./settings.nix
    ];

    services.glance.enable = true;
  };
}
