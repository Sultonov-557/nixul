# Nixul Tags

Counter:
- Explicit tags: `49`
- Host tags: `31`
- User tags: `18`
- Module tags: dynamic (any module path from `nix/modules/**` can be used as a tag)

## Host tags

- `ai/ollama`: enables `services.ai.ollama`.
- `apps`: enables the main host app bundle (gaming, media, system tools, browsers, communication, productivity).
- `apps/gaming/compatibility/proton`: enables `apps.gaming.compatibility.proton`.
- `apps/media/photo/aseprite`: enables `apps.media.photo.aseprite`.
- `apps/user/internet/communication/thunderbird`: enables `apps.user.internet.communication.thunderbird`.
- `apps/user/productivity/todoist`: enables `apps.user.productivity.todoist`.
- `audio`: enables `hardware.audio.pipewire` and `hardware.audio.rtkit`.
- `base`: enables minimal base (`core.system.boot.grub`, `core.system.nix.nix`, `core.system.identity.user`).
- `bluetooth`: enables `hardware.bluetooth.bluetooth` and `hardware.bluetooth.blueman`.
- `compositor/hyprland`: enables `desktop.wms.hyprland`.
- `compositor/niri`: enables `desktop.wms.niri`.
- `core`: enables core host baseline (maintenance, network/security, boot, nix stack, desktop dbus/xdg, terminal tools/shells).
- `desktop`: enables desktop baseline (`dbus`, `xdg`, `cliphist`, `ntfy`, `polkit`, `wayland`, `xserver`, `theming`).
- `dev/base`: enables `dev.git.git` and `dev.git.lazygit`.
- `dev/docker`: enables `services.containers.docker`.
- `dev/node`: enables `dev.runtimes.javascript.nodejs`.
- `dev/python`: enables `dev.runtimes.python`.
- `dev/rust`: enables `dev.runtimes.rustc`.
- `development`: enables the main host dev/security/tooling bundle.
- `display-manager/gdm`: enables `desktop.display-manager.gdm`.
- `display-manager/sddm`: enables `desktop.display-manager.sddm`.
- `gaming/steam`: enables `apps.gaming.platform.steam`.
- `hardware`: enables host hardware baseline (audio, bluetooth, input, network, power, printing, cpu/gpu, zram, usb-automount).
- `hardware/units/storage/udiskie`: enables `hardware.units.storage.udiskie`.
- `laptop`: enables laptop power features (`power-management`, `brightnessctl`, `upower`, `thermald`).
- `network`: enables `hardware.network.networkmanager`.
- `services`: enables host services baseline (AI services, k8s tools, postgres, redis, glance, nginx, vpn).
- `services/containers/docker`: enables `services.containers.docker`.
- `services/containers/podman`: enables `services.containers.podman`.
- `services/monitoring/dashy`: enables `services.monitoring.dashy`.
- `wayland`: enables `desktop.display.wayland`.

## User tags

- `ai/cli`: enables `apps.ai.opencode` and `apps.ai.gemini`.
- `apps`: enables the main user app bundle (AI apps, gaming, media, terminals, browsers, communication, productivity).
- `cli/base`: enables user CLI baseline (`fzf`, `ripgrep`, `zoxide`, `bat`, `eza`, `btop`, `fastfetch`, `starship`).
- `cli/fish`: enables `core.terminal.shells.fish`.
- `cli/tmux`: enables `dev.multiplexers.zellij.zellij`.
- `cli/zsh`: enables `core.terminal.shells.zsh`.
- `core`: enables user core baseline (garbage collector, shells, terminal tools and prompt).
- `desktop`: enables user desktop baseline (components, display manager, wayland/xserver, panels, theming, wms).
- `desktop/components/vicinae`: enables `desktop.components.vicinae`.
- `dev/neovim`: enables `dev.editor.nixvim`.
- `dev/node`: enables JS runtimes (`nodejs`, `bun`, `yarn`).
- `dev/python`: enables `dev.runtimes.python`.
- `dev/rust`: enables `dev.runtimes.rustc`.
- `dev/vscode`: enables `dev.editor.zed`.
- `development`: enables the main user dev/security/tooling bundle.
- `git/base`: enables `dev.git.git`, `dev.git.lazygit`, and `dev.git.git-extras`.
- `hardware/units/storage/udiskie`: enables `hardware.units.storage.udiskie`.
- `services/ai/openclaw`: enables `services.ai.openclaw`.

## Module tags (auto-generated)

If a tag file does not exist under `tags/host` or `tags/user`, the loader checks `nix/modules/**`.

Any module path can be used directly as a tag and resolves to `<modulePath>.enable = true`.

Examples:
- `apps/user/internet/communication/thunderbird` -> `apps.user.internet.communication.thunderbird.enable = true`
- `services/containers/docker` -> `services.containers.docker.enable = true`
- `desktop/components/polkit` -> `desktop.components.polkit.enable = true`
