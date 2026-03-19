{ lib, pkgs, ... }:
{
  metadata = {
    name = "lazygit";
    description = "Module for `dev.git.lazygit`.";
    purpose = "Configure `dev.git.lazygit` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "git"
      "lazygit"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ lazygit ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lazygit";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
