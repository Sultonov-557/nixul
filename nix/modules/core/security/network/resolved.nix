{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { ... }:
    {
      services.resolved = {
        enable = true;
        fallbackDns = [
          "127.0.0.1"
          "::1"
        ];
      };
    };
}
