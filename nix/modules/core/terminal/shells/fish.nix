{ lib, config, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.fish.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    let
      aliasesAdapter = import ../../../lib/aliases.nix { inherit lib; };
      universalAliases = aliasesAdapter.mkAliases config.nixul.aliases;
    in
    {
      programs.fish = lib.mkIf cfg.enable {
        enable = true;
        shellInit = "set -U fish_greeting";
        shellAliases = universalAliases;
      };
    };}
