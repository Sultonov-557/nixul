{ inputs }:

{
  # Flavor metadata
  name = "DankMaterial";
  description = "Hyprland + DankMaterialShell";

  specialisation =
    { config, pkgs, ... }:
    {
      imports = [
        ./system
        inputs.stylix.nixosModules.stylix
      ];

      home-manager.users.nixuser.imports = [
        ./home
      ];
    };
}
