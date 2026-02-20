{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { ... }:
    {
      documentation = {
        enable = true;
        dev.enable = true;
        doc.enable = true;
        info.enable = true;
        man.enable = true;
        nixos.enable = true;
      };
    };
}
