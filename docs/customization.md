# Customization

## How to enable/disable apps
- Shared apps live in `nix/modules/apps/` or similar; set their enable options in host or home configs.
- For host-only apps, add them to `nix/hosts/<host>/home.nix` or a host-local module.
- To disable something, set its enable option to `false` in the host or user config and rebuild.

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
- Override shared defaults per host by setting the same option in `nix/hosts/<host>/system.nix` or `home.nix`.
- For package overrides, use `pkgs.foo.override { ... }` inside a module.
- For one-off tweaks, wrap them in `lib.mkIf` conditions so they are easy to disable later.

## Example customizations
- Enable a desktop service only on laptops:
  ```nix
  { config, lib, ... }:
  let isLaptop = config.networking.hostName == "nomad";
  in {
    config = lib.mkIf isLaptop {
      services.upower.enable = true;
    };
  }
  ```
- Add a browser for a single host:
  ```nix
  { pkgs, ... }:
  {
    home.packages = [ pkgs.firefox ];
  }
  ```
- Swap a theme package for all hosts by editing the relevant module under `nix/modules/desktop/`.
