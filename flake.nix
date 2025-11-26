{
  description = "My Nixos Config";

  inputs = {
    # Core stuff
    ## Nix pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Other stuff
    ## Bars/widgets
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ## Styling/themes
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # Auto-discover flavors from flavors/ directory
      flavorsDir = ./flavors;
      flavorNames = builtins.attrNames (builtins.readDir flavorsDir);

      # Load flavor definitions
      flavors = builtins.listToAttrs (
        map (name: {
          name = name;
          value = import "${flavorsDir}/${name}" { inherit inputs; };
        }) flavorNames
      );

      # Generate specialisations from flavors
      mkSpecialisations =
        flavors:
        builtins.mapAttrs (name: flavor: {
          inheritParentConfig = true;
          configuration = flavor.specialisation;
        }) flavors;
    in
    {
      nixosConfigurations = {
        example-host = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/example-host/configuration.nix
            home-manager.nixosModules.home-manager
            {
              specialisations = mkSpecialisations flavors;
            }
          ];
        };
      };
    };
}
