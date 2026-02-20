{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { pkgs, config, ... }:
    {
      environment.systemPackages = with pkgs; [ bun ];

      home-manager.users.${config.nixul.primaryUser} = {
        programs.bun = {
          enable = true;
        };
      };

      programs.nix-ld.libraries = with pkgs; [
        bun
      ];
    };
}
