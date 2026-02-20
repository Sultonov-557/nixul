{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    imports = [
      ./settings.nix
    ];

    services.glance.enable = true;
  };
}
