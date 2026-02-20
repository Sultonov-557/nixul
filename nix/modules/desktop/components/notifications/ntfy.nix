{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home = {
    services.ntfy-sh = {
      enable = true;
      settings = {
        base-url = "http://ntfy.sh";
      };
    };
  };
}
