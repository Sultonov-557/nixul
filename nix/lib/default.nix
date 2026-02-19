{ inputs }:

let
  inherit (inputs) nixpkgs;

  listDirectories =
    dir:
    builtins.attrNames (
      nixpkgs.lib.filterAttrs (_: value: value == "directory") (builtins.readDir dir)
    );

  mkBaseModules =
    {
      hostname,
      hostsDir,
      modulesDir,
    }:
    [
      ../nixul
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
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
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
