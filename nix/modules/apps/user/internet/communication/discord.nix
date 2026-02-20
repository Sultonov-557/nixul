{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { inputs, ... }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];
      programs.nixcord = {
        enable = true;
      };
    };
}
