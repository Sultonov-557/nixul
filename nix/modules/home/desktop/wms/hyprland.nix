{ inputs, pkgs, ... }: {

  wayland.windowManager.hyprland = {

    xwayland.enable = true;
    systemd.enable = true;

    plugins = [
      inputs.hyprland-virtual-desktops.packages.${pkgs.system}.virtual-desktops
    ];
  };
}
