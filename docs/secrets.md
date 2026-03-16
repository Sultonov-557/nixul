# Secrets

## Overview

Nixul uses `sops-nix` to manage secrets. Encrypted files live in the repo; decrypted content is only available at build time on machines that hold the appropriate Age key.

- Default secrets file: `nix/assets/secrets/secrets.yaml`.
- Default Age key location: `/home/${nixul.user}/.config/sops/age/keys.txt`.

## Enabling sops-nix

The flake already includes `sops-nix` as an input. To enable it, import the module in either a shared module or a host:

```nix
{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
}
```

Most setups will instead rely on the shared module under `nix/modules/core/security/secrets/sops.nix`, which wires sensible defaults.

## Editing or rotating secrets

1. Create an Age key if you do not already have one:
   ```sh
   mkdir -p ~/.config/sops/age
   age-keygen -o ~/.config/sops/age/keys.txt
   ```
2. Export the public key so you can add it to `secrets.yaml`:
   ```sh
   grep public ~/.config/sops/age/keys.txt
   ```
3. Edit the main secrets file:
   ```sh
   export SOPS_AGE_KEY_FILE=$HOME/.config/sops/age/keys.txt
   sops nix/assets/secrets/secrets.yaml
   ```
4. Reference secrets from a module. Example:
   ```nix
   { config, ... }:
   {
     sops.secrets."myapp.env".sopsFile = ../../../nix/assets/secrets/secrets.yaml;

     systemd.services.myapp.serviceConfig.EnvironmentFile =
       config.sops.secrets."myapp.env".path;
   }
   ```
5. Rebuild and test:
   ```sh
   nh os test .#<host>
   nh os switch .#<host>
   ```

## Common pitfalls

- Forgetting to copy the Age key to a new machine; builds that need secrets will fail until the key exists at the expected path.
- Pointing `sopsFile` at the wrong location; keep paths inside the repo so they are available at evaluation time.
- Editing secrets without setting `SOPS_AGE_KEY_FILE`, resulting in unencrypted files.
- Accidentally committing decrypted files; `git status` should show only encrypted blobs under `nix/assets/secrets`.
