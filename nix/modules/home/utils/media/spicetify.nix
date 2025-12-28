{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.media.spicetify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

  options.modules.utils.media.spicetify = {
    enable = lib.mkEnableOption "spicetify";
  };

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts
        adblockify
      ];

      enabledCustomApps = with spicePkgs.apps; [ marketplace ];

      theme = spicePkgs.themes.catppuccin;
    };
  };
}
