{
  lib,
  config,
  user,
  ...
}:
let
  cfg = config.modules.system.services.security.sops;
in
{
  options.modules.system.services.security.sops = {
    enable = lib.mkEnableOption "sops-nix";
  };

  config = lib.mkIf cfg.enable {
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.keyFile = "/home/${user}/.config/sops/age/keys.txt";

      secrets = {
        # Define secrets here:
        # example_secret = {};
      };
    };
  };
}
