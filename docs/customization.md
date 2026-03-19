# Customization

## Enabling and disabling features

Most features are controlled through generated module options.

- Host-level configuration lives under `nixul.host.modules`.
- Per-user configuration lives under `nixul.users.<name>.modules`.

Example host toggle:

```nix
# Enable Nix documentation for this host
nixul.host.modules.core.system.nix.documentation.enable = true;
```

Example per-user toggle:

```nix
# Enable Firefox only for one user
nixul.users.sultonov.modules.apps.user.internet.browsers.firefox.enable = true;
```

Use these trees instead of editing NixOS or Home Manager options directly where possible; modules can then keep related behaviour together.

## Using tags

Tags are reusable module bundles defined under `nix/nixul/tags`.

- Host tags: `loadTags [ "base" "desktop" "gaming/steam" ]`.
- User tags: `loadUserTags [ "dev/base" "dev/rust" ]`.

Tags build initial `modules` trees, which you can override or extend with explicit settings. Tags are the easiest way to turn on consistent sets of tools across multiple hosts.

## Precedence rules (tags, host, user)

Configuration precedence is merge-based and deterministic:

- Inside `loadTags [ ... ]` and `loadUserTags [ ... ]`, values are merged left to right with `lib.recursiveUpdate`; later tags win for the same path.
- Host config then applies host-local overrides by merging `nixul.host.modules = lib.recursiveUpdate (loadTags [ ... ]) { ... };`.
- User config applies user-local overrides the same way under `nixul.users.<name>.modules`.
- Host and user trees are separate inputs to the importer, so they do not override each other directly.

Effective order for one option path:

- module option default (lowest)
- earlier tag values
- later tag values
- explicit host or user override in that entrypoint (highest in that tree)

### Real examples from this repo

Host-side example (`nix/hosts/nomad/default.nix`):

- `apps` host tag enables `apps.user.productivity.todoist.enable = true`.
- `nomad` then overrides it to `false` in the host-local override block.
- Final host value for `apps.user.productivity.todoist.enable` is `false`.

User-side example (`nix/users/sultonov/default.nix`):

- `apps` user tag enables `apps.user.internet.browsers.firefox.enable = true`.
- user-local overrides set `apps.user.internet.browsers.firefox.enable = false`.
- Final user value for that path is `false` for `sultonov`.

### Recommended override pattern

Use three layers and keep overrides in one place:

```nix
{ loadTags, lib, ... }:
{
  nixul.host.modules =
    lib.recursiveUpdate
      (loadTags [
        "core"
        "desktop"
        "services"
      ])
      {
        # machine-specific exceptions only
        services.monitoring.glance.enable = false;
      };
}
```

Pattern guidance:

- Put shared intent in tags (`core`, `desktop`, role-specific tags).
- Keep explicit overrides short and machine/user specific.
- Avoid spread-out overrides across many files for the same option path.
- If host and user both need to influence behavior, prefer splitting that behavior into separate host/user module options instead of fighting on one downstream Nix option.

## Adding extra packages

If a feature module does not yet cover a package you want, you can still add packages directly:

- System-wide:

  ```nix
  { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [ htop btop ];
  }
  ```

- User-level:

  ```nix
  { pkgs, ... }:
  {
    home.packages = [ pkgs.neovim pkgs.git ];
  }
  ```

Prefer adding package choices to modules or tags when they start to be reused across hosts.

## Overriding defaults safely

- Override shared defaults per host by setting the same option path under `nixul.host.modules`.
- For package overrides, use `pkgs.<name>.override { ... }` inside modules or host configs.
- Gate risky or machine-specific tweaks with `lib.mkIf` so they are easy to disable.

Example:

```nix
{ config, lib, ... }:
let
  isLaptop = config.nixul.host.name == "nomad";
in {
  config = lib.mkIf isLaptop {
    services.upower.enable = true;
  };
}
```

## Themes and appearance

Themes live under `nix/nixul/themes` and are loaded from hosts via `loadTheme`.

- Choose a theme in `nix/hosts/<host>/default.nix`:

  ```nix
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
    (loadTheme "gruvbox-material")
  ];
  ```

- Theme modules configure Stylix (cursors, fonts, colours) and may also tune editor or terminal themes.
