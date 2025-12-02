{
  description = "My Minimal NixOS Config";

  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    #Styling
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nur.follows = "nur";
    };

    #WM/DM
    hyprland = {
      url = "github:hyprwm/Hyprland/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces/update-pin";
      inputs.hyprland.follows = "hyprland";
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
      inputs.flake-parts.follows = "flake-parts";
    };

    textfox = {
      url = "github:adriankarlen/textfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    xmcl = {
      url = "github:x45iq/xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Dev tools
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      lib = import ./nix/lib { inherit inputs; };

      flavorsDir = ./nix/flavors;
      flavorNames = builtins.attrNames (builtins.readDir flavorsDir);

      flavors = builtins.listToAttrs (
        map (name: {
          name = name;
          value = import (flavorsDir + "/${name}") { inherit inputs self; };
        }) flavorNames
      );

      hostsDir = ./nix/hosts;
      hostNames = builtins.attrNames (builtins.readDir hostsDir);

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
          value = lib.mkSystem { inherit hostname hostsDir flavors; };
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
