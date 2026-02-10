{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../assets/secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${config.nixul.user}/.config/sops/age/keys.txt";
  };

  environment.systemPackages = with pkgs; [
    sops
    age
  ];
}
