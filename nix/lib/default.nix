{ inputs }:

let
  inherit (inputs) nixpkgs;

  # Helper to get subdirectories
  getDirs =
    dir: builtins.attrNames (nixpkgs.lib.filterAttrs (_: v: v == "directory") (builtins.readDir dir));

  mkSpecialisations =
    flavorsDir:
    let
      flavors = getDirs flavorsDir;
    in
    builtins.listToAttrs (
      map (flavor: {
        name = flavor;
        value = {
          inheritParentConfig = true;
          configuration =
            (import (flavorsDir + "/${flavor}") {
              inherit inputs;
              self = inputs.self;
            }).specialisation;
        };
      }) flavors
    );

  mkSystem =
    {
      hostname,
      hostsDir,
      flavorsDir,
      modulesDir,
      system ? "x86_64-linux",
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        (hostsDir + "/${hostname}")
        (modulesDir + "/system")
        inputs.home-manager.nixosModules.home-manager
        inputs.nur.modules.nixos.default
        inputs.sops-nix.nixosModules.sops
        {
          specialisation = mkSpecialisations flavorsDir;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
in
{
  mkSystems =
    {
      hostsDir,
      flavorsDir,
      modulesDir,
    }:
    let
      hosts = getDirs hostsDir;
    in
    builtins.listToAttrs (
      map (hostname: {
        name = hostname;
        value = mkSystem {
          inherit
            hostname
            hostsDir
            flavorsDir
            modulesDir
            ;
        };
      }) hosts
    );
}
