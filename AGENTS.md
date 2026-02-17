## Build, Lint, and Test

- **Check:** Run `nix flake check --all-systems --show-trace` to evaluate all configurations.
- **Format:** Run `nix fmt` to format all Nix files with `nixfmt`.
- **Lint:** Run `nix develop --command deadnix --fail .` to find and fail on dead code.
- **Dev Shell:** Use `nix develop` to enter a shell with all required tools.
- **Tests:** This project's checks are its tests. There are no separate unit tests.

## Code Style Guidelines

- **Language:** The codebase is primarily written in the Nix language.
- **Formatting:** Adhere to `nixfmt` (enforced by `nix fmt`). Use 2-space indentation.
- **Naming:** Use `kebab-case` for file and directory names (e.g., `my-module.nix`).
- **Imports:** Follow the modular structure. Inputs are managed in `flake.nix`.
- **Modularity:** Configurations are modular via `flake-parts`. New modules should be placed in `nix/modules/`.
- **Types:** Use pattern matching on attribute sets for function arguments to ensure required values are present.
- **Commits:** Follow conventional commit standards.
- **Comments:** Add comments to explain complex logic, not to describe what the code does.
- **Error Handling:** Ensure that Nix expressions fail gracefully with `builtins.tryEval` or provide meaningful error messages using `throw`.

## How to Implement New Features

### Module System Overview
The codebase uses a custom module system located in `nix/modules`.

- **Goal:** Keep the directory tree deep, clean, and easy to navigate.
- **Auto-Imports:** `nix/lib/import-tree.nix` automatically imports all `.nix` files in subdirectories.
- **Auto-Options:** `nix/lib/module-bool.nix` automatically generates a `nixul.<category>.<subcategory>.<name>` boolean option for each module.

### Directory Structure & Rules
(Based on `nix/modules/README.md`)

- **`apps/`**: User-facing programs (browsers, media, gaming, AI).
- **`core/`**: Baseline OS, security, users, time, networking defaults.
- **`desktop/`**: Display stack, compositors, panels, theming.
- **`dev/`**: Developer tools, runtimes, editors.
- **`hardware/`**: Drivers, audio, power, inputs, storage.
- **`services/`**: Long-running daemons, databases, VPNs.

**Rules:**
1.  **Limit Items:** Keep folders at roughly 5 items max. Split into subfolders if it grows larger.
2.  **Naming:** Use `kebab-case` for files and directories.
3.  **Reuse:** Prioritize reusing existing folders over creating new ones.
4.  **`default.nix`:** Only use `default.nix` for ordering or shared configuration; otherwise, rely on auto-imports.

### Step-by-Step Guide
1.  **Decide Location:** Choose the appropriate category based on the rules above.
    - Example: A new AI tool goes in `nix/modules/apps/ai/`.
2.  **Create Module:** Create a new `.nix` file (e.g., `my-tool.nix`).
    ```nix
    { pkgs, ... }:
    {
      # Your configuration here
      environment.systemPackages = [ pkgs.my-tool ];
    }
    ```
    *Note: You do NOT need to define `options` or `mkIf`. The system handles this wrapped in `config` and `options` based on the file path.*

3.  **Enable Module:** In your host configuration (e.g., `nix/hosts/nomad/default.nix`), enable the generated option.
    ```nix
    nixul.apps.ai.my-tool = true;
    ```
