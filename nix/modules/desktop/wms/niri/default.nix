{
  config,
  inputs,
  ...
}:
{
  programs.niri.enable = true;

  home-manager.users.${config.nixul.primaryUser} = {
    imports = [
      inputs.niri.homeModules.niri
      ./keybinds.nix
      ./settings.nix
    ];

    programs.niri.enable = true;
  };
}
