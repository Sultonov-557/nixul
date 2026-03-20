{
  lib,
  inputs,
  config,
  ...
}:
let
  adapter = (import ../../../../nixul/universal/keybinds/adapters/niri) { inherit lib; };
in

{
  metadata = {
    name = "niri";
    description = "Module for `desktop.wms.niri`.";
    purpose = "Configure `desktop.wms.niri` features and defaults.";
    scope = "shared";
    status = "active";
    tags = [
      "desktop"
      "wms"
      "niri"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.niri.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, user, nixul, ... }:
    {
      imports = [
        inputs.niri.homeModules.niri
        ./settings.nix
      ];

      programs.niri.enable = (lib.mkIf cfg.enable true);
      programs.niri.settings.binds = (adapter.mkSettings nixul.users.${user}.keybinds);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable niri";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
