{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.zed-editor
      ];
    };

  home =
    { cfg, ... }:
    let
      userSettings = import ./user-settings.nix;
    in
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nil
          nixd
        ]
      );

      programs.zed-editor = lib.mkIf cfg.enable {
        enable = true;
        extraPackages = with pkgs; [
          nil
          nixd
        ];
        mutableUserDebug = true;
        mutableUserKeymaps = true;
        mutableUserSettings = true;
        mutableUserTasks = true;

        userSettings = userSettings;
      };
    };
  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zed";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
