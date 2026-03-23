{
  provider = {
    litellm = {
      npm = "@ai-sdk/openai-compatible";
      name = "LiteLLM";
      options = {
        baseURL = "https://litellm.home/v1";
        apiKey = "\${LITELLM_MASTER_KEY}";
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
        baseURL = "http://192.168.3.158:11434/v1";
      };
      models = {
        "llama3.1:8b" = {
          name = "llama3.1:8b";
        };
      };
    };
  };

  model = "ollama/llama3.1:8b";
}
