{ pkgs, ... }: {
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    glfw
    vulkan-tools
    libGL
    mesa
    wayland
    wayland-protocols
  ];
}
