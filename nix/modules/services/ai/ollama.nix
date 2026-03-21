{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.ollama = lib.mkIf cfg.enable {
        enable = true;
        loadModels = [ "glm-5:cloud" ];
      };
    };}
