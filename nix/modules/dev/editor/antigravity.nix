{ lib, pkgs, ... }:
{
  metadata = {
    name = "antigravity";
    description = "Module for `dev.editor.antigravity`.";
    purpose = "Configure `dev.editor.antigravity` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "editor"
      "antigravity"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        antigravity
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable antigravity";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
