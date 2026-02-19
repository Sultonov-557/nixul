{ inputs }:
{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { pkgs, config, ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = {
        defaultSopsFile = ../../../assets/secrets/secrets.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/${config.nixul.user}/.config/sops/age/keys.txt";
      };

      environment.systemPackages = [
        pkgs.sops
        pkgs.age
      ];
    };
}
