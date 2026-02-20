{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.ollama = {
      enable = true;
      loadModels = [ "glm-5:cloud" ];
    };
  };
}
