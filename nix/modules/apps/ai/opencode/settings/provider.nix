{ lib, config, ... }:
let
  litellmEnabled = config.nixul.host.modules.services.ai.litellm.enable or false;
in
{
  provider = {
    litellm = lib.mkIf litellmEnabled {
      npm = "@ai-sdk/openai-compatible";
      name = "LiteLLM";
      options = {
        baseURL = "http://litellm.home/v1";
        apiKey = "{file:${config.sops.secrets.litellm-password.path}}";
      };
      models = {
        main = {
          name = "LiteLLM Main";
        };
      };
    };

    ollama = {
      npm = "@ai-sdk/openai-compatible";
      name = "Ollama";
      options = {
        baseURL = "http://127.0.0.1:11434/v1";
      };
      models = {
        "glm-5:cloud" = {
          name = "glm-5:cloud";
        };
      };
    };
  };
}
