{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, lib, ... }:
    {

      services.open-webui = {
        enable = true;
        port = 9999;
      };
    };
}
