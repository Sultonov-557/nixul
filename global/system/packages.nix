{ pkgs, ... }:

{
  # System-wide packages

  # Enable programs
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.direnv.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    # Nix tools
    nixfmt-rfc-style
    deadnix
    nix-tree

    # Development
    vim
    git
    openssl
    nodePackages_latest.nodejs
    bun

    # Containers
    podman-compose
    docker

    # Media & utilities
    playerctl

    # Theming
    catppuccin-gtk
  ];

  # Polkit configuration for disk management
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        action.id.indexOf("org.freedesktop.udisks2.") == 0 &&
        subject.isInGroup("wheel")
      ) {
        return polkit.Result.AUTH_ADMIN_KEEP;
      }
    });
  '';
}
