{ pkgs, ... }: {
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    glfw
    libGL
    mesa
    wayland
    wayland-protocols
  ];
}
