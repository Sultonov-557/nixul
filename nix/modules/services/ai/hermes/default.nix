{
  lib,
  inputs,
  ...
}:
{
  system =
    { cfg, ... }:
    {
      imports = [
        inputs.hermes-agent.nixosModules.default
      ];

      services.hermes-agent = lib.mkIf cfg.enable {
        enable = true;
        addToSystemPackages = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkEnableOption "hermes-agent";
      };
    };
    default = {
      enable = false;
      config = { };
      environment = { };
      documents = { };
      mcpServers = { };
      extraPackages = [ ];
    };
  };

}
