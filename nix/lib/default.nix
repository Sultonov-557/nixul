{ inputs, lib, ... }:

let
  inherit (inputs) nixpkgs;

  themeLib = import ./load-theme.nix { inherit lib; };

  listDirectories =
    dir:
    builtins.attrNames (
      nixpkgs.lib.filterAttrs (_: value: value == "directory") (builtins.readDir dir)
    );

  mkBaseModules =
    {
      hostname,
      hostsDir,
    }:
    [
      ../nixul
      (hostsDir + "/${hostname}")
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
        };
      }
      ./module-importer.nix
    ];

  mkSystem =
    {
      hostname,
      hostsDir,
      system ? "x86_64-linux",
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit (inputs) nix-colors;
        loadTheme = themeLib.loadTheme;
      };
      modules = (
        mkBaseModules {
          inherit hostname hostsDir;
        }
      );
    };
in
{
  mkSystems =
    { hostsDir }:
    let
      hosts = listDirectories hostsDir;
    in
    builtins.listToAttrs (
      map (hostname: {
        name = hostname;
        value = mkSystem { inherit hostname hostsDir; };
      }) hosts
    );

  inherit mkSystem;
}
