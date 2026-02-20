{
  meta = {
    scope = "host";
    system = true;
    hm = true;
  };

  system = {
    programs.fish.enable = true;
  };

  home = _: {
    programs.fish = {
      enable = true;
      shellInit = "set -U fish_greeting";
    };
  };
}
