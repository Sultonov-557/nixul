{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    {
      security.rtkit.enable = true;
    };
}
