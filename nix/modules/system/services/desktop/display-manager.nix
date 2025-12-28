{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.system.services.desktop.displayManager;
in
{
  options.modules.system.services.desktop.displayManager = {
    gdm.enable = lib.mkEnableOption "GDM display manager";
    dms.enable = lib.mkEnableOption "DankMaterial greeter (for GDM)";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.gdm.enable {
      services.displayManager.gdm.enable = true;
    })

    (lib.mkIf cfg.dms.enable {
      services.displayManager.gdm = {
        enable = true;
        # Note: If DankMaterialShell provides a specific GDM theme or configuration,
        # it should be applied here. For now, we enable GDM as requested.
        # If there's a specific package/theme from inputs.dms, we can add it here.
      };
    })
  ];
}
