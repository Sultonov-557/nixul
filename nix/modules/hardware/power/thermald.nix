{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      services.thermald.enable = true;
    };
}
