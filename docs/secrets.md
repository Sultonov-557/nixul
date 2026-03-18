# Secrets

Nixul uses `sops-nix` with encrypted repository files under `nix/assets/secrets/`.

## Current module path
- Shared secrets integration is provided by `nix/modules/core/security/secrets/sops.nix`.
- Hosts usually enable it through `nixul.host.modules.core.security.secrets.sops.enable = true` (directly or via tags/overrides).

## Initial setup
1. Generate an Age key:
   ```bash
   mkdir -p ~/.config/sops/age
   age-keygen -o ~/.config/sops/age/keys.txt
   ```
2. Export key file for editing:
   ```bash
   export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
   ```
3. Edit encrypted secrets:
   ```bash
   sops nix/assets/secrets/password.yaml
   ```

By default, `core.security.secrets.sops` points `defaultSopsFile` to `nix/assets/secrets/password.yaml`.

## Referencing a secret
```nix
{
  sops.secrets."myapp.env".sopsFile = ../../../assets/secrets/password.yaml;

  systemd.services.myapp.serviceConfig.EnvironmentFile =
    config.sops.secrets."myapp.env".path;
}
```

Adjust the `sopsFile` path relative to the file where you define the secret.

## Validate
```bash
nh os test .#<host>
nh os switch .#<host>
```

`nh os test` activates a temporary generation; use `switch` after validation.

## Common failure modes
- Missing key on target machine.
- Wrong `sopsFile` path.
- Editing without `SOPS_AGE_KEY_FILE` set.
- Committing decrypted files instead of encrypted `sops` data.

See `docs/workflows.md` for deployment flow and `docs/recovery.md` for rollback steps.
