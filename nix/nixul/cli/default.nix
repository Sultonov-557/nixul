{ pkgs }:

pkgs.writeShellApplication {
  name = "nixul";
  runtimeInputs = with pkgs; [
    coreutils
    nh
    jq
  ];
  text = ''
    set -euo pipefail

    flake_path="."

    usage() {
      cat <<'EOF'
    Usage:
      nixul [--flake PATH] <command> [args]

    Commands:
      list-hosts              List hosts from nix/hosts
      new <template> [path]   Create a project template (node|rust|python)
      update [input]          Update flake lock (or one input)
      doctor [host]           Validate flake and host evaluation
      build [host]            Run `nh os build`
      test [host]             Run `nh os test`
      switch [host]           Run `nh os switch`
      rebuild [host]          Alias for `switch`
      garbage-collect [age]   Run `nh clean all --keep <age>` (default: 7d)
      list-enabled-modules    Print enabled host/user module paths
      trace <path>            Print final merged value from nixul modules
      help                    Show this help message
    EOF
    }

    err() {
      printf 'nixul: %s\n' "$*" >&2
      exit 1
    }

    if [ "$#" -gt 0 ] && [ "$1" = "--flake" ]; then
      shift
      [ $# -gt 0 ] || err "missing value for --flake"
      flake_path="$1"
      shift
    fi

    command="help"
    if [ $# -gt 0 ]; then
      command="$1"
      shift
    fi

    hosts_dir="$flake_path/nix/hosts"

    require_cmd() {
      command -v "$1" >/dev/null 2>&1 || err "required command not found: $1"
    }

    list_hosts() {
      [ -d "$hosts_dir" ] || err "hosts directory not found: $hosts_dir"

      for path in "$hosts_dir"/*; do
        [ -d "$path" ] || continue
        basename "$path"
      done
    }

    resolve_host() {
      if [ $# -gt 0 ] && [ -n "$1" ]; then
        printf '%s\n' "$1"
        return
      fi

      local host_name
      host_name="$(cat /etc/hostname 2>/dev/null || true)"
      if [ -d "$hosts_dir/$host_name" ]; then
        printf '%s\n' "$host_name"
        return
      fi

      local count=0
      local only_host=""
      while IFS= read -r host; do
        count=$((count + 1))
        only_host="$host"
      done <<EOF
    $(list_hosts)
    EOF

      if [ "$count" -eq 1 ] && [ -n "$only_host" ]; then
        printf '%s\n' "$only_host"
        return
      fi

      err "could not resolve host automatically; pass one explicitly"
    }

    run_nh() {
      local action="$1"
      local host="$2"
      nh os "$action" "$flake_path#$host"
    }

    modules_json() {
      local host="$1"
      nix eval --json "$flake_path#nixosConfigurations.$host.config.nixul.host.modules"
    }

    user_modules_json() {
      local host="$1"
      nix eval --json "$flake_path#nixosConfigurations.$host.config.nixul.users"
    }

    create_node_template() {
      local target="$1"
      mkdir -p "$target"

      cat > "$target/package.json" <<'EOF'
    {
      "name": "project-name",
      "version": "0.1.0",
      "private": true,
      "type": "module",
      "scripts": {
        "start": "node index.js"
      }
    }
    EOF

      cat > "$target/index.js" <<'EOF'
    console.log("hello from nixul node template")
    EOF
    }

    create_python_template() {
      local target="$1"
      mkdir -p "$target"

      cat > "$target/pyproject.toml" <<'EOF'
    [project]
    name = "project-name"
    version = "0.1.0"
    requires-python = ">=3.11"

    [project.scripts]
    app = "main:main"
    EOF

      cat > "$target/main.py" <<'EOF'
    def main() -> None:
        print("hello from nixul python template")


    if __name__ == "__main__":
        main()
    EOF
    }

    create_rust_template() {
      local target="$1"
      mkdir -p "$target/src"

      cat > "$target/Cargo.toml" <<'EOF'
    [package]
    name = "project_name"
    version = "0.1.0"
    edition = "2021"

    [dependencies]
    EOF

      cat > "$target/src/main.rs" <<'EOF'
    fn main() {
        println!("hello from nixul rust template");
    }
    EOF
    }

    case "$command" in
      help|-h|--help)
        usage
        ;;
      list-hosts)
        list_hosts
        ;;
      new)
        template=""
        if [ "$#" -gt 0 ]; then
          template="$1"
        fi
        [ -n "$template" ] || err "missing template (node|rust|python)"
        target="$(pwd)"
        if [ "$#" -gt 1 ]; then
          target="$2"
        fi

        if [ -e "$target" ] && [ -n "$(ls -A "$target" 2>/dev/null)" ]; then
          err "target directory is not empty: $target"
        fi

        case "$template" in
          node)
            create_node_template "$target"
            ;;
          python)
            create_python_template "$target"
            ;;
          rust)
            create_rust_template "$target"
            ;;
          *)
            err "unknown template: $template"
            ;;
        esac

        printf 'created %s template in %s\n' "$template" "$target"
        ;;
      update)
        input_name=""
        if [ "$#" -gt 0 ]; then
          input_name="$1"
        fi
        if [ -n "$input_name" ]; then
          nix flake lock --update-input "$input_name" --flake "$flake_path"
        else
          nix flake update --flake "$flake_path"
        fi
        ;;
      doctor)
        require_cmd nix
        require_cmd nh
        require_cmd jq

        [ -d "$hosts_dir" ] || err "hosts directory not found: $hosts_dir"

        nix flake metadata "$flake_path" >/dev/null

        host_arg=""
        if [ "$#" -gt 0 ]; then
          host_arg="$1"
        fi
        target_host="$(resolve_host "$host_arg")"

        nix eval --raw "$flake_path#nixosConfigurations.$target_host.config.nixul.host.name" >/dev/null
        nix eval --json "$flake_path#nixosConfigurations.$target_host.config.nixul.host.modules" >/dev/null

        printf 'doctor: flake and host %s look good\n' "$target_host"
        ;;
      build|test|switch)
        host_arg=""
        if [ "$#" -gt 0 ]; then
          host_arg="$1"
        fi
        target_host="$(resolve_host "$host_arg")"
        run_nh "$command" "$target_host"
        ;;
      rebuild)
        host_arg=""
        if [ "$#" -gt 0 ]; then
          host_arg="$1"
        fi
        target_host="$(resolve_host "$host_arg")"
        run_nh switch "$target_host"
        ;;
      garbage-collect)
        keep_age="7d"
        if [ "$#" -gt 0 ]; then
          keep_age="$1"
        fi
        nh clean all --keep "$keep_age"
        ;;
      list-enabled-modules)
        host_arg=""
        if [ "$#" -gt 0 ]; then
          host_arg="$1"
        fi
        target_host="$(resolve_host "$host_arg")"

        modules_json "$target_host" |
          jq -r '
            paths(objects | select(has("enable") and .enable == true))
            | map(tostring)
            | join(".")
            | "host." + .
          ' |
          sort

        user_modules_json "$target_host" |
          jq -r '
            to_entries[]
            | .key as $user
            | (.value.modules // {})
            | paths(objects | select(has("enable") and .enable == true))
            | map(tostring)
            | join(".")
            | "user." + $user + "." + .
          ' |
          sort
        ;;
      trace)
        option_path=""
        if [ "$#" -gt 0 ]; then
          option_path="$1"
        fi
        [ -n "$option_path" ] || err "missing option path"

        trace_host_arg=""
        if [ "$#" -gt 1 ]; then
          trace_host_arg="$2"
        fi
        trace_host="$(resolve_host "$trace_host_arg")"

        modules_json "$trace_host" |
          jq -e --arg path "$option_path" 'getpath($path | split("."))' ||
          err "path not found in host modules: $option_path"
        ;;
      *)
        usage
        err "unknown command: $command"
        ;;
    esac
  '';
}
