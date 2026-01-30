{ inputs, pkgs, config, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  home-manager.users.${config.nixul.user} = { inputs, ... }: {
    imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

    programs.spicetify = {
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
}
