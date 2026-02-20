{ inputs, ... }:
{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      imports = [
        inputs.nix-index-database.nixosModules.nix-index
      ];

      config = {
        programs.nix-index = {
          enable = true;
          enableBashIntegration = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        programs.nix-index-database = {
          comma.enable = true;
        };

        environment.systemPackages = [ pkgs.comma ];

        programs.command-not-found.enable = false;
      };
    };
}
