{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      services.printing.enable = true;
    };
}
