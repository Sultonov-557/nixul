{ inputs }:

let
  inherit (inputs) nixpkgs;

  listDirectories =
    dir:
    builtins.attrNames (
      nixpkgs.lib.filterAttrs (_: value: value == "directory") (builtins.readDir dir)
    );

  nixulOptions =
    { lib, ... }:
    {
      options.nixul = {
        user = lib.mkOption {
          type = lib.types.str;
          description = "name of the user";
        };
        email = lib.mkOption {
          type = lib.types.str;
          description = "email of the user";
        };
        hostname = lib.mkOption {
          type = lib.types.str;
          description = "hostname of the machine";
        };
        timezone = lib.mkOption {
          type = lib.types.str;
          description = "timezone of the machine";
        };
        enableAllModules = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "enable every module by default";
        };
      };
    };

  mkBaseModules =
    {
      hostname,
      hostsDir,
      modulesDir,
    }:
    [
      nixulOptions
      (hostsDir + "/${hostname}")
      inputs.home-manager.nixosModules.home-manager
      modulesDir
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
        };
      }
    ];

  mkSystem =
    {
      hostname,
      hostsDir,
      modulesDir,
      system ? "x86_64-linux",
    }:
    let
      hostPath = hostsDir + "/${hostname}";
      nixulDefaults = (import hostPath { }).nixul or { };
    in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs nixulDefaults;
        nixul = import ./module-bool.nix { lib = nixpkgs.lib; };
      };
      modules = mkBaseModules { inherit hostname hostsDir modulesDir; };
    };
in
{
  mkSystems =
    { hostsDir, modulesDir }:
    let
      hosts = listDirectories hostsDir;
    in
    builtins.listToAttrs (
      map (hostname: {
        name = hostname;
        value = mkSystem { inherit hostname hostsDir modulesDir; };
      }) hosts
    );

  inherit mkSystem;
}
