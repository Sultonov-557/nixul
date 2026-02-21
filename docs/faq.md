# FAQ

- **Why `nh` instead of plain `nixos-rebuild`?** It wraps the usual commands with nicer defaults and keeps the interface consistent (`switch`, `test`, `build`, `rollback`).
- **Do I need a dev shell?** No. Use the packaged tools directly: `nix fmt`, `deadnix -- --fail .`, `nix flake check`.
- **Where do secrets live?** In encrypted files managed by `sops-nix`. See `docs/secrets.md`.
- **How do I add a program only for me?** Set `nixul.users.<name>.modules.<path>.enable = true` in your host config.
- **Can I mix system and home options in one file?** Modules can have both `system` and `home` exports in the same file. Host config should stay thin in `default.nix`.
- **How do I know which host I'm on?** Check `nixul.host.name` in `nix/hosts/<host>/default.nix` and match it to `hostnamectl`.
- **Is it safe to edit modules directly?** Yes, but prefer adding new modules over stuffing more into big ones. Small files are easier to debug at 3 AM.
