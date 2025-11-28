{ ... }:

{
  # Flavor metadata
  name = "gnome";
  description = "Minimal GNOME Desktop";

  specialisation =
    { pkgs, modulesPath, ... }:
    {
      services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };

      environment.systemPackages = with pkgs; [
        gnome-tweaks
      ];

      home-manager.users.sultonov.imports = [
        ./home
        "${modulesPath}/nixvim"
      ];
    };
}
