# Secrets

## How secrets are managed
- The flake includes `sops-nix` as an input; add `inputs.sops-nix.nixosModules.sops` to your imports (shared module tree or host) to enable it.
- Secrets should live in encrypted files (e.g., `secrets/<host>.yaml`), not in the repo in plain text.
- Each host can map its secret files to paths or options via a small module in `nix/modules/` or the host folder.

## How to edit or rotate secrets
1) Generate or locate your age key (used by sops):
   ```sh
   age-keygen -o ~/.config/age/keys.txt
   ```
2) Export the public key for team members or future-you:
   ```sh
   grep public ~/.config/age/keys.txt
   ```
3) Create or edit a secret file:
   ```sh
   mkdir -p secrets
   SOPS_AGE_KEY_FILE=~/.config/age/keys.txt sops secrets/<host>.yaml
   ```
4) Add a module that consumes the secret. Example:
   ```nix
   { config, pkgs, ... }:
   {
     sops.secrets."myapp.env".sopsFile = ../../secrets/<host>.yaml;
     systemd.services.myapp.serviceConfig.EnvironmentFile = config.sops.secrets."myapp.env".path;
   }
   ```
5) Rebuild and test:
   ```sh
   nh os test .#<host>
   nh os switch .#<host>
   ```

## Common mistakes
- Forgetting to share the age public key with other machines; they will fail to decrypt.
- Pointing `sopsFile` at a path that is not in the store; use relative paths inside the repo.
- Editing secrets without setting `SOPS_AGE_KEY_FILE`, which results in unencrypted output.
- Committing decrypted files; always ensure `git status` shows only encrypted blobs.
