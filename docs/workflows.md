# Workflows

## Daily rebuild workflow

1. Pull latest changes (or commit yours).
2. Format and lint:
   ```sh
   nix fmt
   deadnix -- --fail .
   ```
3. Evaluate:
   ```sh
   nix flake check --all-systems --show-trace
   ```
4. Test the build without switching:
   ```sh
   nh os test .#<host>
   ```
5. Switch if it looks good:
   ```sh
   nh os switch .#<host>
   ```

## Updating flake inputs

1. Update dependencies:
   ```sh
   nix flake update
   ```
2. Review `flake.lock` changes; if a dependency looks risky, pin it manually before proceeding.
3. Run the daily workflow to test and switch.
4. Keep a rollback generation around until you are confident.

## Debugging failed builds

- Show full evaluation errors:
  ```sh
  nix flake check --all-systems --show-trace
  ```
- Build a single host with extra logs:
  ```sh
  nix build .#<host> --show-trace
  ```
- For fetch or cache hiccups, retry with refresh:
  ```sh
  nix build --refresh .#<host>
  ```
- If a module path is wrong, search the tree:
  ```sh
  rg "myOptionName" nix/modules nix/hosts
  ```

## Rolling back safely

- Immediate rollback to previous generation:
  ```sh
  nh os rollback .#<host>
  ```
- From the bootloader, pick an older generation; once stable, prune old ones:
  ```sh
  nix-collect-garbage -d
  ```
- Avoid building over a broken generation; rollback first, then try a fixed build.

## Testing changes before switching

- Use `nh os test .#<host>` for an activation-free test build.
- For risky changes, build only:
  ```sh
  nh os build .#<host>
  ```
- Validate systemd units:
  ```sh
  systemctl status <unit>
  journalctl -u <unit>
  ```
- When iterating on Home Manager options that read local files, use an impure rebuild only if required:
  ```sh
  sudo nixos-rebuild switch --impure --flake .#<host>
  ```
  Avoid `--impure` unless you really need it.
