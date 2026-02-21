{
  lib,
  hostMods,
  userMods,
  mkNested,
  mergeAll,
  mkCfgOption,
}:
{
  hostOptions = mergeAll (map (module: mkNested module.pathParts (mkCfgOption module)) hostMods);

  userOptions = mergeAll (map (module: mkNested module.pathParts (mkCfgOption module)) userMods);
}
