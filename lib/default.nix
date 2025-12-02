{ inputs }:
let
  inherit (inputs) nixpkgs home-manager;

  mkSpecialisations =
    flavors:
    builtins.mapAttrs (_: flavor: {
      inheritParentConfig = true;
      configuration = flavor.specialisation;
    }) flavors;
in
{
  inherit mkSpecialisations;

  mkSystem =
    {
      hostname,
      system ? "x86_64-linux",
      user ? "sultonov",
      hostsDir,
      flavors,
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        (hostsDir + "/${hostname}/configuration.nix")
        home-manager.nixosModules.home-manager
        inputs.nur.modules.nixos.default
        {
          specialisation = mkSpecialisations flavors;
          home-manager.users.${user} = {
            imports = [ ];
          };
        }
      ];
    };
}
