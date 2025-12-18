# AGENTS.md - Development Guidelines for Nixul

## Build/Lint/Test Commands

- **Build/Check**: `nix flake check --all-systems --show-trace`
- **Format**: `nix fmt` (uses nixfmt-rfc-style)
- **Lint**: `nix develop --command deadnix --fail .`
- **Dev Shell**: `nix develop` (includes pre-commit hooks)

## Code Style Guidelines

### Nix Formatting
- Use `nixfmt-rfc-style` for consistent formatting
- 2-space indentation (per .editorconfig)
- UTF-8 encoding, LF line endings

### Import Patterns
- Use relative imports for modules within same hierarchy
- Use absolute imports from flake inputs: `inputs.nixvim.homeModules.nixvim`
- Group imports: external inputs first, then local modules

### Naming Conventions
- Files: kebab-case (e.g., `keybinds.nix`, `stylix.nix`)
- Variables/Functions: camelCase for lib functions, kebab-case for configurations
- Host/Flavor names: lowercase, descriptive (e.g., `catppuccin`, `evergreen`)

### Module Structure
- Each module should be self-contained with clear imports
- Use `inherit` for passing common arguments
- Follow the pattern: imports → config → options

### Error Handling
- Use `lib.mkIf` for conditional configuration
- Provide sensible defaults in options
- Validate inputs in library functions

### Testing
- No formal test suite - rely on `nix flake check`
- Test configurations by building them: `nix build .#nixosConfigurations.<host>.config.system.build.toplevel`