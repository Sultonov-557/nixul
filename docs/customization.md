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
