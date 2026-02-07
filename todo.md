# NixOS Configuration Roadmap

## � Phase 1: Foundation & Security (Immediate)

- [x] **Formatting & Linting**: Add `nixfmt` to `flake.nix` `formatter`. Run it ensuring consistent style.

## 🏗️ Phase 2: Architecture (Short-term)

- [ ] **Refactor "Monoliths"**: Break down large files like `noctalia.nix` into logical components (e.g., `theme.nix`, `layout.nix`) imported by the main module.
