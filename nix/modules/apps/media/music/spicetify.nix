{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    {
      inputs,
      pkgs,
      ...
    }:
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
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
