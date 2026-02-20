{
  lib,
  hostMods,
  userMods,
  mkNested,
  mergeAll,
  mkCfgOption,
}:
{
  hostOptions = mergeAll (
    map (
      m: mkNested m.pathParts (mkCfgOption ("nixul.modules." + (lib.concatStringsSep "." m.pathParts)))
    ) hostMods
  );

  userOptions = mergeAll (
    map (
      m:
      mkNested m.pathParts (
        mkCfgOption ("nixul.users.*.modules." + (lib.concatStringsSep "." m.pathParts))
      )
    ) userMods
  );
}
