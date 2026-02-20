{
  lib,
  pkgs,
  config,
  userMods,
  userOptions,
  getByPathOrNull,
  assertCfgType,
}:
let
  userNames = builtins.attrNames (config.nixul.users or { });

  mkUserHmImports =
    user:
    let
      userModulesCfg = (userOptions);

      importsMaybe = map (
        m:
        let
          optName = "nixul.users.${user}.modules." + lib.concatStringsSep "." m.pathParts;
          cfg0 = getByPathOrNull m.pathParts userModulesCfg;
          cfg = assertCfgType {
            filePath = m.filePath;
            inherit optName;
            cfg = cfg0;
          };

          homeVal = m.mod.home;
        in
        if cfg == null then
          null
        else if builtins.isFunction homeVal then
          homeVal {
            inherit lib pkgs config;
            cfg = cfg;
            user = user;
          }
        else
          throw ''
            nixul importer: meta.hm=true but `home` is not a function

            Module: ${lib.concatStringsSep "." m.pathParts}
            File: ${toString m.filePath}
            home type: ${builtins.typeOf homeVal}
          ''
      ) userMods;

    in
    builtins.filter (x: x != null) importsMaybe;

  hmUsersImports = lib.genAttrs userNames (user: mkUserHmImports user);
  homeMerged = lib.genAttrs userNames (user: {
    imports = hmUsersImports.${user};
  });
in
{
  inherit hmUsersImports homeMerged;
}
