{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      environment.defaultPackages = with pkgs; [
        hashcat
        hashcat-utils
        clinfo
      ];
    };
}
