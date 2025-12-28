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
      user,
      hostsDir,
      flavors,
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs user; };
      modules = [
        (hostsDir + "/${hostname}/configuration.nix")
        home-manager.nixosModules.home-manager
        inputs.nur.modules.nixos.default
        inputs.sops-nix.nixosModules.sops
        {
          specialisation = mkSpecialisations flavors;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
}
