{ lib, pkgs, ... }:
{
  home =
    { cfg, inputs, ... }:
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

      programs.spicetify = lib.mkIf cfg.enable {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          shuffle
          hidePodcasts
          adblockify
        ];

        enabledCustomApps = with spicePkgs.apps; [ marketplace ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable spicetify";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
