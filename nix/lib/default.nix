{ inputs }:

let
  inherit (inputs) nixpkgs;

  # Helper to get subdirectories
  getDirs = dir:
    builtins.attrNames
    (nixpkgs.lib.filterAttrs (_: v: v == "directory") (builtins.readDir dir));

  mkSystem = { hostname, hostsDir, modulesDir, system ? "x86_64-linux", }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        (hostsDir + "/${hostname}")
        (modulesDir + "/system")
        inputs.home-manager.nixosModules.home-manager
        inputs.nur.modules.nixos.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
in {
  mkSystems = { hostsDir, modulesDir, }:
    let hosts = getDirs hostsDir;
    in builtins.listToAttrs (map (hostname: {
      name = hostname;
      value = mkSystem { inherit hostname hostsDir modulesDir; };
    }) hosts);
}
