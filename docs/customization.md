# Customization

## How to enable/disable apps
- Shared apps live in `nix/modules/apps/` or similar; set their options in host config via `nixul.host.modules.*` or user config via `nixul.users.<name>.modules.*`.
- To disable something, set its `enable` option to `false` and rebuild.

## How to add new packages
- System-wide packages:
  ```nix
  { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [ htop btop ];
  }
  ```
- User packages (Home Manager):
  ```nix
  { pkgs, ... }:
  {
    home.packages = [ pkgs.neovim pkgs.git ];
  }
  ```
- Prefer Home Manager for user-facing tools so hosts stay lean.

## How to override settings
- Override shared defaults per host by setting the same option in `nix/hosts/<host>/default.nix`.
- For package overrides, use `pkgs.foo.override { ... }` inside a module.
- For one-off tweaks, wrap them in `lib.mkIf` conditions so they are easy to disable later.

## Example customizations
- Enable a desktop service only on laptops:
  ```nix
  { config, lib, ... }:
  let isLaptop = config.nixul.host.name == "nomad";
  in {
    config = lib.mkIf isLaptop {
      services.upower.enable = true;
    };
  }
  ```
- Enable a browser for a user:
  ```nix
  nixul.users.sultonov.modules.apps.user.internet.browsers.firefox = { enable = true; };
  ```
- Swap a theme package for all hosts by editing the relevant module under `nix/modules/desktop/`.
