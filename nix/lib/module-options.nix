{ lib }:

{ moduleDefs, ... }:

let
  moduleDefinitionOption = lib.mkOption {
    type = lib.types.nullOr lib.types.attrs;
    default = null;
  };

  moduleDefinitionOptions = lib.foldl' (
    opts: moduleDef: lib.recursiveUpdate opts (lib.setAttrByPath moduleDef.segments moduleDefinitionOption)
  ) { } moduleDefs;
in
moduleDefinitionOptions
