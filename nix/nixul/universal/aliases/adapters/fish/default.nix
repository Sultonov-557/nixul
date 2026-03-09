{ lib }:

aliases:
lib.mapAttrs (_name: alias: alias.command) aliases
