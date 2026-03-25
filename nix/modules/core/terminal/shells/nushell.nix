{ lib, config, ... }:
{

  # TODO: system

  home =
    { cfg, ... }:
    let
      aliasesAdapter = import ../../../../nixul/universal/aliases/adapters/default.nix { inherit lib; };
      universalAliases = aliasesAdapter.mkAliases config.nixul.aliases;
    in
    {
      programs.nushell = lib.mkIf cfg.enable {
        enable = true;
        shellAliases = universalAliases;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nushell";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
