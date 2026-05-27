{ config, lib, ... }:
let
  plugins = import ./settings/plugins.nix;
  agents = import ./settings/agents.nix;
  runtime = import ./settings/runtime.nix;
  permissions = import ./settings/permissions.nix;
  provider = import ./settings/provider.nix { inherit lib config; };
in
plugins // agents // runtime // permissions // provider
