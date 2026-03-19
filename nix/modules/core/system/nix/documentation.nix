{ lib, ... }:
{
  metadata = {
    name = "documentation";
    description = "Module for `core.system.nix.documentation`.";
    purpose = "Configure `core.system.nix.documentation` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "system"
      "nix"
      "documentation"
    ];
  };

  system =
    { cfg, ... }:
    {
      documentation = lib.mkIf cfg.enable {
        enable = true;
        dev.enable = true;
        doc.enable = true;
        info.enable = true;
        man.enable = true;
        nixos.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable documentation";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
