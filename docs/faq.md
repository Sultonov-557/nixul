# FAQ

- **Why use `nh` instead of `nixos-rebuild`?**
  `nh` wraps common NixOS workflows (`switch`, `test`, `build`, `rollback`) with a consistent interface. You can still use `nixos-rebuild` if you prefer.

- **Do I need a dev shell?**
  Not strictly. You can run tools directly (`nix fmt`, `nix flake check`). The recommended way to run `deadnix` is via the dev shell:
  ```sh
  nix develop --command deadnix --fail .
  ```

- **How are modules enabled?**
  Through generated options under `nixul.host.modules` and `nixul.users.<name>.modules`. Most modules have an `enable` option plus additional settings.

- **What are tags?**
  Tags are pre-defined bundles of module options stored under `nix/nixul/tags`. Hosts call `loadTags [ ... ]` to turn on groups of features (base system, desktop, dev stacks, and more).

- **Where do secrets live?**
  In encrypted files under `nix/assets/secrets/` managed by `sops-nix`. See `docs/secrets.md` for details.

- **How do I add a program only for me?**
  Either enable a per-user module under `nixul.users.<name>.modules` or add packages to `home.packages` in your user config.

- **Can I mix system and home options in one module?**
  Yes. Modules can expose `system` and `home` functions to configure both layers from a single file.

- **How do I know which host I am on?**
  Check `nixul.host.name` in `nix/hosts/<host>/default.nix` and compare with `hostnamectl`.

- **Is it safe to edit modules directly?**
  Yes, but favour adding new modules or tags over piling more behaviour into huge ones. Smaller, focused files are easier to debug.
