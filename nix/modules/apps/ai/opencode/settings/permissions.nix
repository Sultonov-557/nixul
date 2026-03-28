{
  permission = {
    bash = "ask";
    edit = "ask";
    read = "allow";
    grep = "allow";
    glob = "allow";
    list = "allow";
    lsp = "allow";
    google_search = "allow";
    websearch = "allow";
    skill = {
      "*" = "ask";
      "nix-*" = "allow";
      "git-*" = "allow";
      "docker-*" = "allow";
    };
    task = {
      "*" = "ask";
      "planner" = "allow";
      "explorer" = "allow";
      "implementer" = "allow";
      "reviewer" = "allow";
    };
    todowrite = "allow";
    todoread = "allow";
    webfetch = "allow";
    question = "allow";
    memory = "allow";
  };
}
