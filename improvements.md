# Improvements

This document outlines potential improvements for the Nixul NixOS configuration system.

## 1. Clean Code

### 1.1 Refactor Module Importer

The `module-importer.nix` is 272 lines and handles multiple concerns. Consider splitting into:

- `module-importer/validation.nix` - path validation logic
- `module-importer/config.nix` - config merging

### 1.2 Consolidate Similar Options

Many modules have nearly identical patterns (e.g., `apps.system.terminal.*`). Create a shared base module for terminal apps that handles common config:

```nix
# nix/modules/core/terminal-apps-base.nix
# Common options for all terminal applications
```

### 1.3 Reduce Host Config Verbosity

The sentinel host (`nix/hosts/sentinel/default.nix`) has 300+ lines of module enablements. Consider:

- Group related modules into tags/bundles
- Add a `defaults` section for common patterns

## 2. New Apps/Tools/Services

### 2.1 Dev Tools

- **terraform** - Infrastructure as code
- **ansible** - Configuration management
- **podman-compose** - Container compose support
- **devbox** - Reproducible dev environments
- **mise** - Dev tools versioning (alternative to mise Nix)
- **1password** - Secret management CLI
- **gitleaks** - Secrets scanning in git
- **trivy** - Vulnerability scanner
- **checkov** - Terraform security scanning

### 2.2 Media

- **spotify** - Via nixpkgs or spicetify
- **audacity** - Audio editing
- **obs-studio** - Streaming/recording
- **HandBrake** - Video encoding
- **Kdenlive** - Video editing

### 2.3 System

- **bottom** - Rust-based system monitor (btop alternative)
- **yazi** (already exists but could add more config)
- **zellij** (already exists but minimal config)
- **atuin** (already exists but could enhance)

### 2.4 AI/ML

- **llama.cpp** - Local LLM inference
- **text-generation-webui** - Web UI for LLMs
- **stable-diffusion-webui** - Image generation

### 2.5 Services

- **maddy** - All-in-one mail server
- **syncthing** - File sync daemon
- **bitwarden_rs** - Password vault (alternative to vaultwarden)
- **pleroma** - Fediverse server
- **gatus** - Health monitoring
- ** uptime-kuma** - Self-hosted monitoring

### 2.6 Security

- **Wazuh** - SIEM/security monitoring
- **fail2ban** (exists but could add more jail configs)
- **clamav** - Antivirus

## 3. Better Module Configuration

### 3.1 Docker/Podman

Add more comprehensive configuration:

- Volume management
- Network configuration
- Resource limits
- Compose file support

### 3.2 Kubernetes Modules

Currently only basic enablement. Add:

- Helm configuration
- Kubeconfig management
- Context switching
- kubectl aliases

### 3.3 Hyprland Improvements

- Add more workspace configurations
- Add window rule presets
- Add animation configs
- Add notification integration

### 3.4 Terminal Improvements

- Add tmux configuration module
- Add wezterm configuration (currently disabled)
- Add kitty config (currently minimal)

### 3.5 Browser Improvements

- Add firefox profile management
- Add extension management
- Add cookie/session handling

## 4. Documentation

### 4.1 Missing Docs

- Host creation guide
- Module authoring guide expansion
- Testing strategies
- Troubleshooting guide

### 4.2 Add Examples

- Example user configuration
- Example custom module
- Example hardware config

## 5. Testing/CI

### 5.1 Add CI Pipeline

- Run `nix flake check` on PRs
- Validate module paths
- Check for unused variables
- Test builds in parallel

### 5.2 Add Integration Tests

- Test specific module combinations
- Validate host configurations

## 6. Quality of Life

### 6.1 Add Overlay System

Allow users to easily override package versions via a nixpkgs overlay.

### 6.2 Add Module Templates

Create templates for common module patterns to ease contribution.

### 6.3 Add Quick Start Scripts

- Script to generate new host
- Script to add new user
- Script to add new module

## Priority Recommendations

1. **High**: Add terraform, ansible, spotify, audacious modules
2. **Medium**: Refactor host config with tags/bundles, improve kubernetes modules
3. **Low**: CI pipeline, documentation expansion, lazy evaluation

---

_Generated: 2026-04-01_

