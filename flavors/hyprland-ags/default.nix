{ inputs }:

{
  # Flavor metadata
  name = "hyprland";
  description = "Hyprland + AGS Desktop Environment";

  # Specialisation configuration
  # This defines what gets added when this flavor is selected in GRUB
  specialisation =
    { config, pkgs, ... }:
    {
      imports = [
        ./system
        inputs.stylix.nixosModules.stylix
      ];

      # Home-Manager configuration for this flavor
      home-manager.users.nixuser.imports = [
        ./home
      ];
    };
}
