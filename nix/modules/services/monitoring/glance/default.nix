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
    config = {
      services.glance.enable = true;
    };
  };
}
