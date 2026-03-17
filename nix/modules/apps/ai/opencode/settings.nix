let
  plugins = import ./settings/plugins.nix;
  agents = import ./settings/agents.nix;
  runtime = import ./settings/runtime.nix;
  permissions = import ./settings/permissions.nix;
in
plugins // agents // runtime // permissions
