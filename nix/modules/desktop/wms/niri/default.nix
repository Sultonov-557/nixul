{ inputs, ... }:
{
  meta = {
    scope = "user";
    hm = true;
    system = true;
  };

  system = _: {
    programs.niri.enable = true;
  };

  home = _: {
    imports = [
      inputs.niri.homeModules.niri
      ./keybinds.nix
      ./settings.nix
    ];

    programs.niri.enable = true;
  };
}
