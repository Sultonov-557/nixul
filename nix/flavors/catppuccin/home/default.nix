{ ... }:

{
  imports = [
    ../../../modules/home/editor/nixvim
    ../../../modules/home/terminal/ghostty.nix
    ../../../modules/home/desktop/hyprland.nix

    ../../../modules/home/terminal/shell.nix
    ../../../modules/home/terminal/git.nix
    ../../../modules/home/terminal/bun.nix
    ../../../modules/home/terminal/lazydocker.nix
    ../../../modules/home/desktop/screenshots.nix
    ../../../modules/home/desktop/notifications.nix
    ../../../modules/home/browsers/firefox.nix
    ../../../modules/home/browsers/spicetify.nix
    ../../../modules/home/utils/archives.nix
    ../../../modules/home/utils/documents.nix
    ../../../modules/home/utils/media.nix
    ../../../modules/home/utils/dbeaver.nix
    ../../../modules/home/utils/gimp.nix
    ../../../modules/home/utils/aseprite.nix
    ../../../modules/home/utils/baobab.nix
    ../../../modules/home/utils/btop.nix
    ../../../modules/home/desktop/cliphist.nix
    ../../../modules/home/desktop/udiskie.nix
    ../../../modules/home/desktop/thumbnails.nix
    ../../../modules/home/desktop/audio.nix
    ../../../modules/home/communication/discord.nix
    ../../../modules/home/communication/telegram.nix
    ../../../modules/home/communication/thunderbird.nix
    ../../../modules/home/productivity/libreoffice.nix
    ../../../modules/home/productivity/obsidian.nix
    ../../../modules/home/productivity/khal.nix
    ../../../modules/home/productivity/todoist.nix

    ./stylix.nix
    ./nixvim.nix
    ./caelestia.nix

    ./hyprland/settings.nix
    ./hyprland/keybinds.nix
    ./hyprland/rules.nix
  ];
}
