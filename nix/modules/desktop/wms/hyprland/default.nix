{ lib, config, ... }:
let
  adapter = (import ../../../../nixul/universal/keybinds/adapters/hyprland) { inherit lib; };
in
{
  metadata = {
    name = "hyprland";
    description = "Module for `desktop.wms.hyprland`.";
    purpose = "Configure `desktop.wms.hyprland` features and defaults.";
    scope = "shared";
    status = "active";
    tags = [
      "desktop"
      "wms"
      "hyprland"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.hyprland.enable = lib.mkIf cfg.enable true;
      services.displayManager.dms-greeter.compositor.name = lib.mkIf cfg.enable "hyprland";
    };

  home =
    { cfg, user, nixul, ... }:
    {
      imports = [ ./settings.nix ];
      wayland.windowManager.hyprland = lib.mkIf cfg.enable {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        settings = adapter.mkSettings nixul.users.${user}.keybinds;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hyprland";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
