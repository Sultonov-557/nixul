{ inputs, ... }:
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

      config = {
        sops = {
          defaultSopsFile = ../../../assets/secrets/secrets.yaml;
          defaultSopsFormat = "yaml";
          age.keyFile = "/home/${config.nixul.primaryUser}/.config/sops/age/keys.txt";
        };

        environment.systemPackages = [
          pkgs.sops
          pkgs.age
        ];
      };
    };
}
