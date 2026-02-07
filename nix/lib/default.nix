{ inputs }:

let
  inherit (inputs) nixpkgs;

  getDirs =
    dir: builtins.attrNames (nixpkgs.lib.filterAttrs (_: v: v == "directory") (builtins.readDir dir));

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

      modules = [
        (
          { lib, ... }:
          {
            options.nixul.user = lib.mkOption {
              type = lib.types.str;
              description = "name of the user";
            };
          }
        )
        (hostsDir + "/${hostname}")
        inputs.home-manager.nixosModules.home-manager
        inputs.nur.modules.nixos.default
        (modulesDir + "")
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
in
{
  mkSystems =
    { hostsDir, modulesDir }:
    let
      hosts = getDirs hostsDir;
    in
    builtins.listToAttrs (
      map (hostname: {
        name = hostname;
        value = mkSystem { inherit hostname hostsDir modulesDir; };
      }) hosts
    );
}
