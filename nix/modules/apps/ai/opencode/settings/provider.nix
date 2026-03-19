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
  };

  model = "litellm/main";
  small_model = "litellm/main";
}
