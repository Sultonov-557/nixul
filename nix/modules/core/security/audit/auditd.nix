{ lib, ... }:
{
  metadata = {
    name = "auditd";
    description = "Host-level Linux auditing for traceability, incident response, and compliance evidence.";
    purpose = "Provide a reusable audit baseline with sane default rules and an optional immutable lock mode for hardened hosts.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "audit"
      "forensics"
      "compliance"
    ];
  };

  system =
    { cfg, ... }:
    {
      security = lib.mkIf cfg.enable {
        auditd.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable Linux audit subsystem and auditd";
        };
      };
    };

    default = {
      enable = false;
    };
  };
}
