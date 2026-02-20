{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      services.printing.drivers = with pkgs; [
        hplip
      ];
    };
}
