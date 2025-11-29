{
  description = "My Minimal NixOS Config";

  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Styling
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #WM/DM
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Bar/Shell
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Apps/Tools
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    xmcl = {
      url = "github:x45iq/xmcl-nix";
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

      flavorsDir = ./flavors;
      flavorNames = builtins.attrNames (builtins.readDir flavorsDir);

      flavors = builtins.listToAttrs (
        map (name: {
          name = name;
          value = import (flavorsDir + "/${name}") {
            inherit inputs self;
          };
        }) flavorNames
      );

      mkSpecialisations =
        flavors:
        builtins.mapAttrs (name: flavor: {
          inheritParentConfig = true;
          _name = name;
          configuration = flavor.specialisation;
        }) flavors;

      hostsDir = ./hosts;
      hostNames = builtins.attrNames (builtins.readDir hostsDir);

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
            (hostsDir + "/${hostname}/configuration.nix")
            home-manager.nixosModules.home-manager
            {
              specialisation = mkSpecialisations flavors;
              home-manager.users.${user} = {
                imports = [ ];
              };
            }
          ];
        };

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
      nixosConfigurations = builtins.listToAttrs (
        map (hostname: {
          name = hostname;
          value = mkSystem { inherit hostname; };
        }) hostNames
      );

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
