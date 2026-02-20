{ inputs }:
{
  meta = {
    scope = "user";
    hm = true;
    system = true;
  };

  system = {
    programs.niri.enable = true;
  };

  home =
    { ... }:
    {
      imports = [
        inputs.niri.homeModules.niri
        ./keybinds.nix
        ./settings.nix
      ];

      programs.niri.enable = true;
    };
}
