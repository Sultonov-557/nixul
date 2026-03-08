{ loadUserTags, lib, ... }:
{
  nixul = {
    primaryUser = "example";
    users.example = {
      email = "example@example.com";

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
            core.terminal.tools.display.bat.enable = true;
            core.terminal.tools.display.eza.enable = true;
            core.terminal.tools.history.atuin.enable = true;
            core.terminal.tools.history.thefuck.enable = true;
            core.terminal.tools.info.fastfetch.enable = true;
            core.terminal.tools.info.lsof.enable = true;
            core.terminal.tools.info.tty-clock.enable = true;
            core.terminal.tools.monitor.btop.enable = true;
            core.terminal.tools.monitor.tcpdump.enable = true;
            core.terminal.tools.navigation.fzf.enable = true;
            core.terminal.tools.navigation.ripgrep.enable = true;
            core.terminal.tools.navigation.zoxide.enable = true;
            core.terminal.tools.prompt.starship.enable = true;
            core.terminal.shells.fish.enable = true;
            core.terminal.shells.zsh.enable = true;

            apps.ai.codex.enable = true;
            apps.ai.cursor.enable = true;
            apps.ai.gemini.enable = true;
            apps.ai.opencode.enable = true;
            apps.gaming.compatibility.proton.enable = true;
            apps.gaming.compatibility.wine.enable = true;
            apps.gaming.games.minecraft.enable = true;
            apps.gaming.platform.gamemode.enable = true;
            apps.gaming.platform.gamescope.enable = true;
            apps.gaming.platform.lutris.enable = true;
            apps.gaming.platform.steam.enable = true;
            apps.media.audio.pamixer.enable = true;
            apps.media.audio.pavucontrol.enable = true;
            apps.media.audio.playerctl.enable = true;
            apps.media.audio.pulsemixer.enable = true;
            apps.media.music.spicetify.enable = true;
            apps.media.music.yandex.enable = true;
            apps.media.photo.aseprite.enable = true;
            apps.media.photo.gimp.enable = true;
            apps.media.photo.lutgen.enable = true;
            apps.media.video.ffmpeg.enable = true;
            apps.media.video.mpv.enable = true;
            apps.system.disk.gparted.enable = true;
            apps.system.files.analyzers.baobab.enable = true;
            apps.system.files.analyzers.ncdu.enable = true;
            apps.system.files.archives.file-roller.enable = true;
            apps.system.files.archives.p7zip.enable = true;
            apps.system.files.archives.unzip.enable = true;
            apps.system.files.archives.zip.enable = true;
            apps.system.files.managers.nautilus.enable = true;
            apps.system.files.managers.yazi.enable = true;
            apps.system.monitors.mission-center.enable = true;
            apps.system.terminal.foot.enable = true;
            apps.system.terminal.ghostty.enable = true;
            apps.system.terminal.kitty.enable = true;
            apps.user.internet.browsers.chrome.enable = true;
            apps.user.internet.browsers.firefox.enable = true;
            apps.user.internet.browsers.tor.enable = true;
            apps.user.internet.browsers.zen-browser.enable = true;
            apps.user.internet.communication.discord.enable = true;
            apps.user.internet.communication.telegram.enable = true;
            apps.user.internet.communication.thunderbird.enable = true;
            apps.user.internet.qbitttorrent.enable = true;
            apps.user.productivity.khal.enable = true;
            apps.user.productivity.libreoffice.enable = true;
            apps.user.productivity.obsidian.enable = true;
            apps.user.productivity.todoist.enable = true;

            desktop.components.cliphist.enable = true;
            desktop.components.notifications.mako.enable = true;
            desktop.components.notifications.ntfy.enable = true;
            desktop.components.polkit.enable = true;
            desktop.components.screenshots.enable = true;
            desktop.display-manager.gdm.enable = true;
            desktop.display.wayland.enable = true;
            desktop.display.xserver.enable = true;
            desktop.panels.caelestia.enable = true;
            desktop.panels.noctalia.enable = true;
            desktop.theming.themes.gruvbox-material.enable = true;
            desktop.wms.hyprland.enable = true;
            desktop.wms.niri.enable = true;

            dev.editor.antigravity.enable = true;
            dev.editor.nixvim.enable = true;
            dev.editor.zed.enable = true;
            dev.git.git.enable = true;
            dev.git.git-extras.enable = true;
            dev.git.github.enable = true;
            dev.git.lazygit.enable = true;
            dev.multiplexers.zellij.enable = true;
            dev.runtimes.cpp.enable = true;
            dev.runtimes.javascript.bun.enable = true;
            dev.runtimes.javascript.nodejs.enable = true;
            dev.runtimes.javascript.prisma.enable = true;
            dev.runtimes.javascript.yarn.enable = true;
            dev.runtimes.python.enable = true;
            dev.runtimes.rustc.enable = true;
            dev.security.analysis.burbsuite.enable = true;
            dev.security.analysis.caido.enable = true;
            dev.security.analysis.inetutils.enable = true;
            dev.security.analysis.metasploit.enable = true;
            dev.security.analysis.wireshark.enable = true;
            dev.security.brute-force.hashcat.enable = true;
            dev.security.brute-force.hydra.enable = true;
            dev.security.brute-force.john.enable = true;
            dev.security.brute-force.wordlists.enable = true;
            dev.security.mitm.ettercap.enable = true;
            dev.security.scanning.assetfinder.enable = true;
            dev.security.scanning.bettercap.enable = true;
            dev.security.scanning.katana.enable = true;
            dev.security.scanning.netcat.enable = true;
            dev.security.scanning.nmap.enable = true;
            dev.security.scanning.nuclei.enable = true;
            dev.security.wireless.wifite2.enable = true;
            dev.tools.containers.lazydocker.enable = true;
            dev.tools.db.dbeaver.enable = true;
            dev.tools.db.usql.enable = true;
            dev.tools.env.direnv.enable = true;
            dev.tools.http.client.bruno.enable = true;
            dev.tools.http.client.hurl.enable = true;
            dev.tools.http.client.simplehttp.enable = true;
            dev.tools.http.client.xh.enable = true;
            dev.tools.http.server.ngrok.enable = true;
            dev.tools.quality.biome.enable = true;
            dev.tools.quality.deadnix.enable = true;
          };
    };
  };
}
