{ lib, pkgs, ... }:
{
  metadata = {
    name = "tcpdump";
    description = "Module for `core.terminal.tools.monitor.tcpdump`.";
    purpose = "Configure `core.terminal.tools.monitor.tcpdump` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "monitor"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        tcpdump
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable tcpdump";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
