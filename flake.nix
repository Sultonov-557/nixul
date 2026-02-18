{
  description = "Nixul: A modular NixOS configuration system";

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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Styling
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    # WM/DM
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Bar/Shell
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Apps/Tools
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/743d55655850160a7ab43d0bacf22afd7c9fa445";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
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

    xmcl = {
      url = "github:x45iq/xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{ flake-parts, ... }:
    let
      lib = import ./nix/lib { inherit inputs; };

      nixosConfigurations = lib.mkSystems {
        hostsDir = ./nix/hosts;
        modulesDir = ./nix/modules;
      };

      hostBuilds = builtins.mapAttrs (_: cfg: cfg.config.system.build.toplevel) nixosConfigurations;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, ... }:
        {
          formatter = pkgs.nixfmt;

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              deadnix
              nixfmt
            ];
          };

          packages = hostBuilds;

          checks = hostBuilds;
        };

      flake = {
        inherit nixosConfigurations;
      };
    };
}
