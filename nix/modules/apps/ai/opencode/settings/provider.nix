{
  provider = {
    litellm = {
      npm = "@ai-sdk/openai-compatible";
      name = "LiteLLM";
      options = {
        baseURL = "http://litellm.home/v1";
        apiKey = "admin";
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
