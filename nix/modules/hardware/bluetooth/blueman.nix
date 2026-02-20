{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      services.blueman.enable = true;
    };
}
