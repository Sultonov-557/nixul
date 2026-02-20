{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      services.upower.enable = true;
    };
}
