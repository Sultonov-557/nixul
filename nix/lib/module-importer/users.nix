{
  lib,
  config,
  userMods,
  assertCfgType,
  ...
}:
let
  userNames = builtins.attrNames (config.nixul.users or { });

  evaluateUserModule =
    user: module:
    let
      modPath = lib.concatStringsSep "." module.pathParts;
      homeVal = module.mod.home;
      homeType = builtins.typeOf homeVal;
    in
    if !(builtins.isFunction homeVal) then
      throw ''
        nixul importer: module has meta.home=true but `home` is not a function

        Module: ${modPath}
        File: ${toString module.filePath}
        home type: ${homeType}
      ''
    else
      (
        {
          lib,
          pkgs,
          config,
          inputs,
          ...
        }:
        let
          optName = "nixul.users.${user}.modules." + lib.concatStringsSep "." module.pathParts;

          cfg0 = lib.attrByPath (
            [
              "nixul"
              "users"
              user
              "modules"
            ]
            ++ module.pathParts
          ) (module.options.default or { }) config;

          cfg = assertCfgType {
            filePath = module.filePath;
            inherit optName;
            cfg = cfg0;
          };

          _ = builtins.trace (
            "nixul importer: "
            + modPath
            + " user="
            + user
            + " cfg="
            + (if cfg == null then "null" else "set")
            + " file="
            + toString module.filePath
          ) null;

          evaluated = (
            builtins.tryEval (homeVal {
              inherit
                lib
                pkgs
                config
                inputs
                ;
              cfg = cfg;
              user = user;
            })
          );
        in
        if evaluated.success then
          evaluated.value
        else
          throw ''
            nixul importer: evaluating home failed

            Module: ${modPath}
            File: ${toString module.filePath}
            User: ${user}
          ''
      );

  mkUserHmImports = user: map (evaluateUserModule user) userMods;

  hmUsersImports = lib.genAttrs userNames (user: mkUserHmImports user);
  homeMerged = lib.genAttrs userNames (user: {
    imports = hmUsersImports.${user};
    home.stateVersion = "26.05";
  });
in
{
  inherit hmUsersImports homeMerged;
}
