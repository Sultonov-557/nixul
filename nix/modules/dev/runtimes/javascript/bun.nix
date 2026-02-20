{
  meta = {
    scope = "user";
    system = true;
    hm = true;
  };

  home =
    { }:
    {
      programs.bun = {
        enable = true;
      };
    };

  system =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ bun ];

      programs.nix-ld.libraries = with pkgs; [
        bun
      ];
    };
}
