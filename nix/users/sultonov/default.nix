{ loadUserTags, lib, ... }:
{
  nixul = {
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";

      keybinds = import ./keybinds;
      bookmarks = import ./bookmarks.nix;

      modules =
        lib.recursiveUpdate
          (loadUserTags [
            "cli/base"
            "cli/fish"
            "cli/tmux"
            "cli/zsh"
            "dev/neovim"
            "dev/node"
            "dev/python"
            "dev/rust"
            "dev/vscode"
            "git/base"
            "ai/cli"
          ])
          {
            core.maintenance.garbage-collector.enable = true;
            core.security.ssh.ssh.enable = true;
            core.terminal.tools.display.bat.enable = true;
            core.terminal.tools.display.eza.enable = true;
            core.terminal.tools.history.atuin.enable = true;
            core.terminal.tools.history.thefuck.enable = true;
            core.terminal.tools.info.fastfetch.enable = true;
            core.terminal.tools.monitor.btop.enable = true;
            core.terminal.tools.navigation.fzf.enable = true;
            core.terminal.tools.navigation.zoxide.enable = true;
            core.terminal.tools.prompt.starship.enable = true;
            core.terminal.shells.fish.enable = true;
            core.terminal.shells.zsh.enable = true;

            apps.ai.codex.enable = true;
            apps.ai.cursor.enable = true;
            apps.ai.gemini.enable = true;
            apps.ai.opencode.enable = true;
            apps.gaming.games.minecraft.enable = true;
            apps.gaming.platform.lutris.enable = false;
            apps.media.music.spicetify.enable = false;
            apps.media.music.yandex.enable = true;
            apps.media.video.mpv.enable = true;
            apps.system.files.archives.file-roller.enable = true;
            apps.system.files.archives.p7zip.enable = true;
            apps.system.files.archives.unzip.enable = true;
            apps.system.files.archives.zip.enable = true;
            apps.system.files.managers.yazi.enable = true;
            apps.system.terminal.foot.enable = false;
            apps.system.terminal.ghostty.enable = true;
            apps.system.terminal.kitty.enable = false;
            apps.user.internet.browsers.firefox.enable = false;
            apps.user.internet.browsers.zen-browser.enable = true;
            apps.user.internet.communication.discord.enable = true;
            apps.user.productivity.khal.enable = true;

            desktop.theming.enable = true;
            desktop.components.vicinae.enable = true;
            desktop.components.cliphist.enable = true;
            desktop.components.notifications.mako.enable = true;
            desktop.components.polkit.enable = true;
            desktop.components.screenshots.enable = true;
            desktop.panels.caelestia.enable = false;
            desktop.panels.noctalia.enable = true;
            desktop.wms.hyprland.enable = true;
            desktop.wms.niri.enable = true;

            dev.editor.nixvim.enable = true;
            dev.editor.zed.enable = false;
            dev.git.git.enable = true;
            dev.git.github.enable = true;
            dev.multiplexers.zellij.enable = true;
            dev.runtimes.javascript.bun.enable = true;
            dev.tools.containers.lazydocker.enable = true;
            dev.tools.env.direnv.enable = true;
            dev.tools.env.devenv.enable = true;
            dev.tools.quality.deadnix.enable = true;

            hardware.units.storage.udiskie.enable = true;
          };
    };
  };
}
