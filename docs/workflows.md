# Workflows

## Daily rebuild

1. Pull latest changes (or commit your local changes).
2. Format and lint Nix code:
   ```sh
   nix fmt
   nix develop --command deadnix --fail .
   ```
3. Evaluate all hosts:
   ```sh
   nix flake check --all-systems --show-trace
   ```
4. Build a host without activating it:
   ```sh
   nh os test .#<host>
   ```
5. Switch if everything looks good:
   ```sh
   nh os switch .#<host>
   ```

## Updating flake inputs

1. Update inputs:
   ```sh
   nix flake update
   ```
2. Inspect `flake.lock` to see what changed.
3. Run the daily workflow (format, lint, `nix flake check`, `nh os test`, `nh os switch`).
4. Keep at least one known-good generation in the bootloader until you are confident.

## Debugging failed builds

- Show full evaluation errors:
  ```sh
  nix flake check --all-systems --show-trace
  ```
- Build a single host with extra logs:
  ```sh
  nix build .#<host> --show-trace
  ```
- For fetch or cache issues, retry with refresh:
  ```sh
  nix build --refresh .#<host>
  ```
- If a module or option path is wrong, search the tree:
  ```sh
  rg "myOptionName" nix/modules nix/hosts
  ```

## Rolling back safely

- Immediately roll back the last activation:
  ```sh
  nh os rollback .#<host>
  ```
- From the bootloader, choose an older generation; once the system is stable, prune old ones:
  ```sh
  nix-collect-garbage -d
  ```

## Testing changes before switching

- Use `nh os test .#<host>` for an activation-free test build.
- For risky changes, build only:
  ```sh
  nh os build .#<host>
  ```
- Check important services:
  ```sh
  systemctl status <unit>
  journalctl -u <unit>
  ```
- When iterating on modules that read local files, you can fall back to an impure rebuild as a last resort:
  ```sh
  sudo nixos-rebuild switch --impure --flake .#<host>
  ```
  Prefer pure builds where possible.
