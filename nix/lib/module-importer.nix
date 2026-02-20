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
  loader = import ./module-importer/module-loader.nix { inherit lib pkgs inputs; };

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

  host = import ./module-importer/host.nix {
    inherit lib pkgs config;
    inherit (discovery) hostMods;
    inherit (optionTrees) hostOptions;
    inherit (utils) getByPathOrNull;
    inherit (types) assertCfgType;
  };

  # users = import ./module-importer/users.nix {
  #   inherit lib pkgs config;
  #   inherit (discovery) userMods;
  #   inherit (optionTrees) userOptions;
  #   inherit (utils) getByPathOrNull;
  #   inherit (types) assertCfgType;
  # };

in
{
  imports = host.hostImports; # ++ users.hmUsersImports;
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
  };

  config = lib.mkMerge [
    # step 6/7
    host.hostMerged
    {
      #home-manager.users = users.homeMerged;
    }
    {
      nixul._userModuleOptions = optionTrees.userModuleOptions;
      nixul._systemModuleOptions = optionTrees.hostOptions;
      warnings = [
        ("nixul importer discovered: " + (toString (builtins.length discovery.discovered)) + " modules")
      ];
    }
  ];
}
