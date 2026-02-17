{
  config,
  inputs,
  ...
}:
{
  programs.niri.enable = true;

  services.displayManager.dms-greeter.compositor.name = "niri";

  home-manager.users.${config.nixul.user} = {
    imports = [
      inputs.niri.homeModules.niri
      ./keybinds.nix
      ./settings.nix
    ];

    programs.niri.enable = true;
  };
}