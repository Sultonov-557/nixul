# FAQ

- **Why `nh` instead of plain `nixos-rebuild`?** It wraps the usual commands with nicer defaults and keeps the interface consistent (`switch`, `test`, `build`, `rollback`).
- **Do I need a dev shell?** No. Use the packaged tools directly: `nix fmt`, `deadnix -- --fail .`, `nix flake check`.
- **Where do secrets live?** In encrypted files managed by `sops-nix`. See `docs/secrets.md`.
- **How do I add a program only for me?** Put it in `nix/hosts/<host>/home.nix` under `home.packages` or enable a Home Manager module.
- **Can I mix system and home options in one file?** You can, but keep system options in `system.nix` and user options in `home.nix` so future-you can find them.
- **What if a build fails after updating inputs?** Roll back, pin the problematic input, and rerun `nix flake update` selectively.
- **How do I know which host I'm on?** Check `networking.hostName` in `nix/hosts/<host>/system.nix` and match it to `hostnamectl`.
- **Is it safe to edit modules directly?** Yes, but prefer adding new modules over stuffing more into big ones. Small files are easier to debug at 3 AM.
