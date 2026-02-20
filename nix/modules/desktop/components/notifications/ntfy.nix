{
  meta = {
    scope = "user";
    hm = false;
    system = true;
  };

  system = _: {
    services.ntfy-sh = {
      enable = true;
      settings = {
        base-url = "http://ntfy.sh";
      };
    };
  };
}
