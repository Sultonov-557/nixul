{ lib, ... }:
{
  metadata = {
    name = "ollama";
    description = "Module for `services.ai.ollama`.";
    purpose = "Configure `services.ai.ollama` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "ai"
      "ollama"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.ollama = lib.mkIf cfg.enable {
        enable = true;
        loadModels = [ "glm-5:cloud" ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ollama";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
