## Build, Lint, and Test

- **Check:** Run `nix flake check --all-systems --show-trace` to evaluate all configurations.
- **Format:** Run `nix fmt` to format all Nix files with `nixfmt-rfc-style`.
- **Lint:** Run `nix develop --command deadnix --fail .` to find and fail on dead code.
- **Dev Shell:** Use `nix develop` to enter a shell with all required tools.
- **Tests:** This project's checks are its tests. There are no separate unit tests.

## Code Style Guidelines

- **Language:** The codebase is primarily written in the Nix language.
- **Formatting:** Adhere to `nixfmt-rfc-style` (enforced by `nix fmt`). Use 2-space indentation.
- **Naming:** Use `kebab-case` for file and directory names (e.g., `my-module.nix`).
- **Imports:** Follow the modular structure. Inputs are managed in `flake.nix`.
- **Modularity:** Configurations are modular via `flake-parts`. New modules should be placed in `nix/modules/`.
- **Types:** Use pattern matching on attribute sets for function arguments to ensure required values are present.
- **Commits:** Follow conventional commit standards.
- **Comments:** Add comments to explain complex logic, not to describe what the code does.
- **Error Handling:** Ensure that Nix expressions fail gracefully with `builtins.tryEval` or provide meaningful error messages using `throw`.
