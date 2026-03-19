{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  modulesRoot = ../modules;

  utils = import ./module-importer/utils.nix { inherit lib; };
  types = import ./module-importer/types.nix { inherit lib; };
  loader = import ./module-importer/module-loader.nix {
    inherit
      lib
      pkgs
      inputs
      config
      ;
  };

  discovery = import ./module-importer/discover.nix {
    inherit lib modulesRoot;
    inherit (utils)
      dirEntryFile
      isNixFile
      sanitizeParts
      ;
    loadModule = loader.loadModule;
  };

  optionTrees = import ./module-importer/options.nix {
    inherit lib;
    inherit (discovery) hostMods userMods;
    inherit (utils)
      mkNested
      mergeAll
      ;
    inherit (types) mkCfgOption;
  };

  metadataTrees = import ./module-importer/metadata.nix {
    inherit lib;
    inherit (discovery)
      discovered
      hostMods
      userMods
      ;
    inherit (utils)
      mkNested
      mergeAll
      ;
  };

  host = import ./module-importer/host.nix {
    inherit
      lib
      pkgs
      config
      inputs
      ;
    inherit (discovery) hostMods;
    inherit (optionTrees) hostOptions;
    inherit (utils) getByPathOrNull;
    inherit (types) assertCfgType;
  };

  users = import ./module-importer/users.nix {
    inherit
      lib
      pkgs
      config
      inputs
      ;
    inherit (discovery) userMods;
    inherit (optionTrees) userOptions;
    inherit (utils) getByPathOrNull;
    inherit (types) assertCfgType;
  };

in
{
  imports = host.hostImports;
  options = {
    nixul._systemModuleOptions = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated system module options tree (internal).";

    };

    nixul._userModuleOptions = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated per-user module options tree (internal).";
    };

    nixul._moduleMetadata = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated metadata tree for all discovered modules (internal).";
    };

    nixul._hostModuleMetadata = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated metadata tree for system-capable modules (internal).";
    };

    nixul._userModuleMetadata = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated metadata tree for home-capable modules (internal).";
    };
  };

  config = lib.mkMerge [
    {
      home-manager.users = users.homeMerged;
    }
    {
      nixul._userModuleOptions = optionTrees.userOptions;
      nixul._systemModuleOptions = optionTrees.hostOptions;
      nixul._moduleMetadata = metadataTrees.allModuleMetadata;
      nixul._hostModuleMetadata = metadataTrees.hostModuleMetadata;
      nixul._userModuleMetadata = metadataTrees.userModuleMetadata;
      warnings = [
        ("nixul importer discovered: " + (toString (builtins.length discovery.discovered)) + " modules")
      ];
    }
  ];
}
