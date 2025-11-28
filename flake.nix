{
  description = "My Minimal NixOS Config";

  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Dev tools
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
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
      pkgs = nixpkgs.legacyPackages.${system};

      # Auto-discover flavors from flavors/ directory
      flavorsDir = ./flavors;
      flavorNames = builtins.attrNames (builtins.readDir flavorsDir);

      # Load flavor definitions
      flavors = builtins.listToAttrs (
        map (name: {
          name = name;
          value = import "${flavorsDir}/${name}" {
            inherit inputs self;
            modulesPath = ./modules;
          };
        }) flavorNames
      );

      # Generate specialisations from flavors
      mkSpecialisations =
        flavors:
        builtins.mapAttrs (name: flavor: {
          inheritParentConfig = true;
          configuration = flavor.specialisation;
        }) flavors;

      mkSystem =
        {
          hostname,
          system ? "x86_64-linux",
          user ? "sultonov",
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${hostname}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              specialisation = mkSpecialisations flavors;
              # Global home-manager config
              home-manager.users.${user} = {
                imports = [
                ];
              };
            }
          ];
        };

      # Pre-commit checks
      preCommit = inputs.pre-commit-hooks.lib.${system};
      preCommitCheck = preCommit.run {
        src = ./.;
        hooks = {
          nixfmt-rfc-style = {
            enable = true;
          };
          deadnix = {
            enable = true;
          };
        };
      };
    in
    {
      nixosConfigurations = {
        home-pc = mkSystem { hostname = "home-pc"; };
        laptop = mkSystem { hostname = "laptop"; };
      };

      checks.${system}.pre-commit = preCommitCheck;
      devShells.${system}.default = pkgs.mkShell {
        shellHook = preCommitCheck.shellHook;
        packages = with pkgs; [
          nixfmt-rfc-style
          deadnix
          git
        ];
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
