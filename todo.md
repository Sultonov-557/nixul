# NixOS Configuration Roadmap

## � Phase 1: Foundation & Security (Immediate)
- [ ] **Secret Management**: Implement `sops-nix` or `agenix` to encrypt secrets (API keys, passwords, tokens). Do not store them in plain text in the repo.
- [ ] **Formatting & Linting**: Add `alejandra` or `nixfmt` to `flake.nix` `formatter`. Run it ensuring consistent style.
- [ ] **Fix Hardcoded Values**: Remove hardcoded UIDs in `hardware-configuration.nix` to prevent permission issues during migration/reinstalls.

## 🏗️ Phase 2: Architecture (Short-term)
- [ ] **Standardize Modules**: Even with the hybrid approach, ensure your custom modules use `lib.mkOption` to define their interface. This adds type checking and documentation (e.g., `man configuration.nix` will show your options).
- [ ] **Refactor "Monoliths"**: Break down large files like `noctalia.nix` into logical components (e.g., `theme.nix`, `layout.nix`) imported by the main module.

## 🛠️ Phase 3: The "Modern Unix" Experience (Programs to Add)
Enhance your terminal workflow with modern Rust-based replacements:

- [ ] **Shell Enhancements**:
    - `starship`: Fast, customizable cross-shell prompt.
    - `zoxide`: Smarter `cd` command that learns your habits.
    - `atuin`: Sync & search shell history (Ctrl+R replacement).
- [ ] **CLI Tools**:
    - `bat`: `cat` clone with syntax highlighting and git integration.
    - `eza`: Modern replacement for `ls`.
    - `ripgrep` (`rg`) & `fd`: Faster replacements for `grep` and `find`.
    - `fzf`: General-purpose fuzzy finder (essential for scripts).
- [ ] **TUI Workflows**:
    - `yazi` or `superfile`: Niri is keyboard-centric; a terminal file manager fits perfectly.
    - `lazygit`: powerful TUI for git operations.
    - `zellij` or `tmux`: Terminal multiplexer for persistent sessions.

## 🎨 Phase 4: Niri & Wayland Polish (Long-term)
- [ ] **Lock Screen**: Implement `swaylock-effects` or `hyprlock` for a beautiful lock screen experience.
- [ ] **Logout Menu**: Add `wlogout` for a graphical shutdown/reboot menu.
- [ ] **Notifications**: Evaluate `swaync` (Sway Notification Center) for a control center experience if `mako` feels too simple.
- [ ] **Clipboard**: Ensure `cliphist` or `wl-clipboard` is set up with a history viewer (`rofi` or `fuzzel`).

## �️ Phase 5: Hardening
- [ ] **Firewall**: Explicitly define allowed ports in a central networking module.
- [ ] **DNS/Privacy**: Consider `dns-over-https` or `unbound` for privacy.
- [ ] **Sandboxing**: Explore `firejail` for untrusted applications.
