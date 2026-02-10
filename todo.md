# NixOS Configuration Roadmap

## 🧱 Phase 0: Repo Hygiene (Right now)

- [x] **Repo structure**: Split into `hosts/`, `modules/system/`, `modules/home/`, `pkgs/`, `lib/`.
- [x] **Flake outputs sanity**: `nixosConfigurations`, `packages`, `devShells`, `checks`, `formatter`.
- [x] **Formatting & Linting**: Add `nixfmt` to `flake.nix` `formatter`. Run it ensuring consistent style.
- [x] **CI**: `nix flake check --all-systems` + build your main host.
- [ ] **Docs**: `README.md` with “how to bootstrap”, “how to rebuild”, “how to add a host/flavor”, “common fixes”.
- [x] **Modules layout**: Adopt core/hardware/desktop/dev/apps/services program-per-file structure under `nix/modules`.
- [x] **Pinned nixpkgs**: Ensure lock is committed and updated intentionally (not randomly).

---

## 🔒 Phase 1: Foundation & Security (Immediate)

- [x] **Users & groups**: Main user in needed groups (`wheel`, `networkmanager`, `video`, `audio`, etc).
- [ ] **SSH hardening**:
  - [ ] Disable password auth (keys only).
  - [ ] Disable root login.
  - [ ] Restrict to LAN/VPN interfaces if possible.
- [x] **Firewall**:
  - [x] `networking.firewall.enable = true;`
  - [x] Only open ports you actually use (and per-interface if needed).
- [ ] **Secrets management** (choose one and commit):
  - [ ] `sops-nix` (common W).
  - [ ] `agenix`.
  - [ ] `systemd-credentials` for some cases.
- [ ] **Kernel/sysctl basics**:
  - [ ] Enable reasonable sysctls (network hardening, etc) without breaking stuff.
- [ ] **Sandboxing**:
  - [ ] Ensure `nix.settings.sandbox = true` (and keep it unless you _really_ need off).
- [ ] **Audit what runs at boot**:
  - [ ] List enabled services.
  - [ ] Kill anything you don’t need.

---

## 🧩 Phase 2: Nix Core Settings (Stability & Speed)

- [x] **Nix settings**:
  - [x] `experimental-features = [ "nix-command" "flakes" ];`
  - [x] Enable `auto-optimise-store`.
- [x] **Substituters & caches**:
  - [x] Add official cache.
  - [x] Add any extra caches you rely on (and pin keys).
- [x] **Garbage collection strategy**:
  - [x] Auto GC schedule.
  - [x] Keep-generations policy (system + home).
- [x] **Rollback confidence**:
  - [x] Confirm system rollbacks work from boot menu.
  - [x] Confirm home-manager rollback works (if you use HM).
- [ ] **Binary cache hygiene**:
  - [ ] Document “what breaks if cache is down”.
- [x] **Build performance**:
  - [x] `max-jobs`, `cores`, `keep-outputs`/`keep-derivations` (if useful).
- [x] **nix-index**:
  - [x] Enable `nix-index` / `comma` for “what package provides this command”.
- [x] **Command-not-found**:
  - [x] Enable NixOS module or use `nix-index` integration.

---

## 🌐 Phase 3: Networking & Connectivity

- [x] **Network stack choice**:
  - [x] NetworkManager (desktop).
- [x] **DNS**:
  - [x] Decide: `systemd-resolved` vs custom (unbound/dnscrypt).
- [x] **Time sync**:
  - [x] Ensure NTP is on (`systemd-timesyncd` or equivalent).
- [ ] **VPN setup**:
  - [ ] WireGuard profile(s).
  - [ ] “Kill switch” behavior if that matters.
- [ ] **mDNS / local discovery**:
  - [ ] Avahi if you use local stuff/printers.
- [ ] **Proxy support**:
  - [ ] System-wide env vars if you’re behind proxies sometimes.
- [ ] **SSH client config**:
  - [ ] Host aliases, IdentityFile rules, agent behavior.

---

## 🖥️ Phase 4: Boot, Hardware, and Drivers

- [x] **Bootloader**:
  - [x] GRUB.
- [x] **Initrd & filesystem**:
  - [x] Confirm modules needed for your storage controller.
- [ ] **Microcode**:
  - [ ] Intel/AMD microcode enabled.
- [ ] **GPU drivers**:
  - [ ] NVIDIA/AMD/Intel configured correctly.
  - [ ] Wayland + Electron quirks addressed (env vars, ozone, portals).
- [ ] **Laptop stuff (if applicable)**:
  - [ ] TLP / power-profiles-daemon (pick one).
  - [ ] Suspend/hibernate settings.
  - [ ] Lid close behavior.
- [ ] **Bluetooth**:
  - [ ] BlueZ enabled.
  - [ ] Audio profiles working (A2DP, HFP if needed).
- [ ] **Printer/scanner**:
  - [ ] CUPS + drivers.
  - [ ] sane/scan support if you own a scanner.
- [x] **Input devices**:
  - [x] Touchpad gestures, natural scroll, accel curves.
- [ ] **Firmware**:
  - [ ] `fwupd` enabled if you want firmware updates.

---

## 🎨 Phase 5: Desktop UX (Wayland, Portals, Theme)

- [x] **Display server**:
  - [x] Wayland compositor configured (niri/hypr/sway/etc).
- [x] **Portals**:
  - [x] Correct `xdg-desktop-portal` backend for your compositor.
  - [x] Screen sharing works in browsers + apps.
- [x] **Polkit agent**:
  - [x] Ensure a polkit agent runs on login.
- [x] **Greeter / login manager**:
  - [x] GDM setup stable.
- [x] **Theming**:
  - [x] Stylix (or your method) applied consistently.
  - [x] GTK + Qt both covered.
  - [x] Cursor/theme/icons/fonts aligned.
- [x] **Fonts**:
  - [x] Nerd Font.
  - [x] CJK/emoji support.
  - [x] Fontconfig defaults.
- [x] **Notifications**:
  - [x] Notification daemon setup (mako/dunst/etc).
- [x] **Clipboard manager**:
  - [x] Wayland clipboard history if you want it.
- [x] **Screenshots / screen recording**:
  - [x] grim/slurp/wl-clipboard, or your stack.
- [ ] **IME input**:
  - [ ] fcitx5/ibus if you type multilingual.

---

## 🔊 Phase 6: Audio, Video, and Media

- [x] **PipeWire**:
  - [x] pipewire + wireplumber enabled.
  - [x] PulseAudio compatibility.
- [x] **Low-latency / pro audio (optional)**:
  - [x] rtkit / limits / qpwgraph tools.
- [ ] **Camera/mic permissions**:
  - [ ] App access works (browser meets portals).
- [ ] **Codecs**:
  - [ ] Decide on unfree codecs and set policy.
- [x] **Media tools**:
  - [x] ffmpeg, mpv, OBS (if you stream/record).

---

## 🧰 Phase 7: Shell, CLI, and Dev Environment

- [x] **Shell**:
  - [x] zsh/fish setup + completions.
  - [x] Starship or prompt of choice.
- [x] **Terminal emulator**:
  - [x] Foot/kitty/alacritty configured.
- [x] **CLI essentials**:
  - [x] `ripgrep`, `fd`, `jq`, `yq`, `bat`, `eza`, `fzf`, `tldr`, `tmux/zellij`.
- [ ] **Git config**:
  - [x] user.name/email, gpg/ssh signing if you want.
  - [ ] global ignores and aliases.
- [ ] **Direnv + nix-direnv**:
  - [ ] Auto dev shells per project.
- [x] **Language toolchains** (as you need):
  - [x] Node/Bun, Rust, Go, Python, Java, etc.
- [x] **LSP + editor**:
  - [x] Neovim/NixVim config: LSP, formatter, treesitter, lint.
- [ ] **Debugging tools**:
  - [ ] strace, lsof, tcpdump, gdb/lldb.
- [x] **Containers**:
  - [x] Docker or Podman (pick one) + compose.

---

## 🧪 Phase 8: Reproducible Dev & Builds

- [ ] **DevShells**:
  - [ ] Per-language shells with pinned tools.
  - [ ] `shellHook` for env vars + helpful info.
- [ ] **Templates**:
  - [ ] `nix flake init -t ...` templates for your common stacks (TS backend, Rust, etc).
- [ ] **Build checks**:
  - [ ] `nix flake check` covers formatting + unit tests + type checks where possible.
- [ ] **Local cache**:
  - [ ] Optional: `nix-serve` / attic / cachix for your own builds.

---

## 🧱 Phase 9: Services & Self-Hosting (Optional but nice)

- [ ] **Reverse proxy**:
  - [ ] nginx/caddy baseline with sane TLS defaults.
- [ ] **TLS**:
  - [ ] ACME/Let’s Encrypt automation (if public).
  - [ ] Internal CA for LAN (if private).
- [x] **DBs**:
  - [x] Postgres/Redis with backups + auth.
- [ ] **Monitoring**:
  - [ ] prometheus/node_exporter + grafana (or a simpler setup).
- [ ] **Log management**:
  - [ ] journald limits, persistent logs if desired.
- [ ] **Backups for services**:
  - [ ] DB dumps + config backups.

---

## 💾 Phase 10: Backups, Recovery, and “Oh no” Plan

- [ ] **Backups**:
  - [ ] Borg/Restic + schedule.
  - [ ] Off-device location (NAS/cloud/external drive).
- [ ] **Snapshot strategy**:
  - [ ] btrfs snapshots or ZFS snapshots if you use them.
- [ ] **Impermanence (optional)**:
  - [ ] Decide if you want ephemeral root + persisted dirs.
- [ ] **Restore drill**:
  - [ ] Actually test restoring one file and one full config.
- [ ] **Rescue media**:
  - [ ] Build a minimal NixOS ISO from your flake.
  - [ ] Document: how to decrypt/mount and recover.

---

## 🎮 Phase 11: Gaming & Performance (Optional)

- [x] **Steam**:
  - [x] steam + proton + gamemode (if you use it).
- [ ] **MangoHUD**:
  - [ ] performance overlay.
- [ ] **GPU tuning**:
  - [ ] VRR, tearing settings, power limits.
- [ ] **Controller support**:
  - [ ] udev rules, steam-input.
- [x] **Wine**:
  - [x] bottles/lutris (if you need it).
- [ ] **Wayland quirks**:
  - [ ] XWayland settings, input latency tweaks.

---

## 🧠 Phase 12: Quality-of-Life Automation

- [ ] **Systemd user services**:
  - [ ] Autostart things the clean way (not random shell hacks).
- [ ] **Notifications for failures**:
  - [ ] backup failure notifications.
- [ ] **Disk cleanup**:
  - [ ] Store GC schedule + log size limits.
- [ ] **Battery/thermal**:
  - [ ] Notifications for low battery, thermal throttling.

---

## 🧬 Phase 13: Multi-host, Flavors, and Consistency

- [x] **Host modules**:
  - [x] Shared core module + per-host overrides.
- [ ] **Secrets per-host**:
  - [ ] Separate secrets per machine and per environment (dev vs prod).

---

## ✅ Phase 14: Final “Am I done?” Checklist

- [ ] **Fresh install test**: Can you install from zero using your flake?
- [ ] **Rebuild test**: `nixos-rebuild switch --flake .#HOST` works without manual steps.
- [x] **Rollback test**: Rollback works from boot and from CLI.
- [ ] **Network test**: Wi-Fi/Ethernet/VPN all stable.
- [ ] **Portal test**: Screen share works (browser + apps).
- [x] **Audio test**: Mic + output devices + Bluetooth headset.
- [ ] **Sleep test**: Suspend/resume doesn’t break input/audio/network.
- [ ] **Printing test** (if needed): Print a page.
- [ ] **Security scan vibe-check**: No open ports you didn’t choose. No secrets in git.
- [ ] **Docs done**: “How to recover” is written like you’ll forget everything in 6 months (because you will).

---
