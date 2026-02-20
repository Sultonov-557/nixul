{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.pay-respects = {
        enable = true;
        options = [
          "--alias"
          "f"
        ];
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };
}
