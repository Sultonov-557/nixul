{ inputs }:

{
  # Flavor metadata
  name = "DankMaterial";
  description = "Hyprland + DankMaterialShell";

  specialisation =
    { ... }:
    {
      imports = [
        ./system
        # stylix is inherited from parent
      ];

      home-manager.users.sultonov.imports = [
        ./home
        inputs.dankMaterialShell.homeModules.dankMaterialShell.default
        inputs.zen-browser.homeModules.beta
        inputs.zen-nebula.homeModules.default
        inputs.xmcl.homeModules.xmcl
        inputs.nixcord.homeModules.nixcord
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];
    };
}
