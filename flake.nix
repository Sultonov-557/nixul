{
  description = "My NixOS Config";

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

    # Styling/themes
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Desktop Environment & Window Manager
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications
    xmcl = {
      url = "github:x45iq/xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    zen-nebula = {
      url = "github:JustAdumbPrsn/Nebula-A-Minimal-Theme-for-Zen-Browser/b1fabe759ad2cfc4b745158b163ead75b1247f15";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Dev tools
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

    # AGS (kept from template as it might be used by DankMaterial or other flavors)
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
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
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              specialisation = mkSpecialisations flavors;
              # Global home-manager config
              home-manager.users.${user} = {
                imports = [
                  # Stylix is handled globally via the nixosModule, but we might need to ensure
                  # home-manager integration is active if not automatically handled.
                  # However, specific apps are removed from here.
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
