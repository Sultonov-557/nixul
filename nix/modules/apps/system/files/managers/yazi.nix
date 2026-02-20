{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      programs.yazi.enable = true;
      environment.systemPackages = with pkgs; [
        yazi
        ueberzugpp
      ];
    };
}
