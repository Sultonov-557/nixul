{ lib, pkgs, ... }:
{
  home =
    { cfg, config, ... }:
    let
      strictHostKeyChecking = "accept-new";
      serversSecretFile = null;
    in
    {
      programs.ssh = lib.mkIf cfg.enable {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks."*" = { };
        extraConfig = lib.mkIf (serversSecretFile != null) ''
          Include ~/.ssh/config.d/99-sops-servers.conf
        '';
      };

      home.packages = lib.mkIf (cfg.enable && serversSecretFile != null) [
        pkgs.jq
        pkgs.sops
        pkgs.sshpass
      ];

      home.sessionPath = lib.mkIf (cfg.enable && serversSecretFile != null) [
        "$HOME/.local/bin"
      ];

      home.activation.sopsSshServers = lib.mkIf (cfg.enable && serversSecretFile != null) ''
        set -euo pipefail

        ssh_dir="${config.home.homeDirectory}/.ssh"
        config_dir="$ssh_dir/config.d"
        config_file="$config_dir/99-sops-servers.conf"
        known_hosts_file="$ssh_dir/known_hosts_sops"
        password_dir="$ssh_dir/sops-passwords"
        bin_dir="${config.home.homeDirectory}/.local/bin"

        mkdir -p "$ssh_dir" "$config_dir" "$password_dir" "$bin_dir"
        chmod 700 "$ssh_dir" "$password_dir"

        tmp_json=$(mktemp)
        trap 'rm -f "$tmp_json"' EXIT

        if ! SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt" ${pkgs.sops}/bin/sops -d '${toString serversSecretFile}' > "$tmp_json" 2>/dev/null; then
          cp '${toString serversSecretFile}' "$tmp_json"
        fi

        if ! ${pkgs.jq}/bin/jq -e '.servers | type == "array"' "$tmp_json" > /dev/null; then
          echo "core.security.ssh.ssh: decrypted secret must contain a \"servers\" array" >&2
          exit 1
        fi

        : > "$config_file"
        chmod 600 "$config_file"
        : > "$known_hosts_file"
        chmod 600 "$known_hosts_file"

        ${pkgs.jq}/bin/jq -c '.servers[]' "$tmp_json" | while IFS= read -r server; do
          name=$(${pkgs.jq}/bin/jq -r '.name // empty' <<< "$server")
          host=$(${pkgs.jq}/bin/jq -r '.host // empty' <<< "$server")
          user=$(${pkgs.jq}/bin/jq -r '.user // empty' <<< "$server")
          password=$(${pkgs.jq}/bin/jq -r '.password // empty' <<< "$server")
          port=$(${pkgs.jq}/bin/jq -r '.port // 22' <<< "$server")
          known_host=$(${pkgs.jq}/bin/jq -r '.knownHost // empty' <<< "$server")

          if [ -z "$name" ] || [ -z "$host" ] || [ -z "$user" ] || [ -z "$password" ]; then
            echo "core.security.ssh.ssh: each server requires name, host, user and password" >&2
            exit 1
          fi

          if [[ ! "$name" =~ ^[A-Za-z0-9._-]+$ ]]; then
            echo "core.security.ssh.ssh: invalid server name '$name'" >&2
            exit 1
          fi

          password_file="$password_dir/$name"
          printf '%s\n' "$password" > "$password_file"
          chmod 600 "$password_file"

            {
              echo "Host $name"
              echo "  HostName $host"
              echo "  User $user"
              echo "  Port $port"
              echo "  HostKeyAlias $name"
              echo "  UserKnownHostsFile ~/.ssh/known_hosts ~/.ssh/known_hosts_sops"
              echo "  StrictHostKeyChecking ${strictHostKeyChecking}"
              echo
            } >> "$config_file"

          if [ -n "$known_host" ]; then
            printf '%s %s\n' "$name" "$known_host" >> "$known_hosts_file"
          fi

          launcher="$bin_dir/$name"
          {
            echo "#!${pkgs.bash}/bin/bash"
            echo "set -euo pipefail"
            echo "exec ${pkgs.sshpass}/bin/sshpass -f '$password_file' ${pkgs.openssh}/bin/ssh '$name' \"\$@\""
          } > "$launcher"
          chmod 700 "$launcher"
        done
      '';
    };}
