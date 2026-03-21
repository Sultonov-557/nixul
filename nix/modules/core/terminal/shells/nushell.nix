{ lib, config, ... }:
{
  home =
    { cfg, ... }:
    let
      aliasesAdapter = import ../../../lib/aliases.nix { inherit lib; };
      universalAliases = aliasesAdapter.mkAliases config.nixul.aliases;
    in
    {
      programs.nushell = lib.mkIf cfg.enable {
        enable = true;
        shellAliases = universalAliases;

      };
    };}
