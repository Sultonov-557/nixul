{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };
}
