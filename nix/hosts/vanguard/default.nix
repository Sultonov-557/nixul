{
  loadTags,
  loadTheme,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
    (loadTheme "gruvbox-material")
  ];

  home-manager.users.sultonov.wayland.windowManager.hyprland.settings.monitor = [
    "DP-1,1920x1080@60,0x0,1"
    "HDMI-A-1,1280x1024@60,1920x0,1"
  ];

  nixul.host = {
    name = "vanguard";
    timezone = "Asia/Tashkent";
    location = "Tashkent";
    bookmarks = import ./bookmarks.nix;

    modules =
      lib.recursiveUpdate
        (loadTags [
          "base"
          "bluetooth"
          "network"
          "wayland"
          "laptop"
          "audio"
          "compositor/hyprland"
          "compositor/niri"
          "display-manager/gdm"
          "display-manager/sddm"
          "desktop"
          "dev/base"
          "dev/docker"
          "dev/node"
          "dev/python"
          "dev/rust"
          "gaming/steam"
          "ai/ollama"
        ])
        {
          core.maintenance.auto-upgrade.enable = true;
          core.maintenance.journald.enable = true;
          core.security.network.acme.enable = true;
          core.security.network.avahi.enable = true;
          core.security.network.firewall.enable = true;
          core.security.network.resolved.enable = true;
          core.security.network.unbound.enable = true;
          core.security.secrets.sops.enable = true;
          core.security.ssh.openssh.enable = true;
          core.security.sysctl.enable = true;
          core.system.desktop.dbus.enable = true;
          core.system.desktop.xdg.enable = true;
          core.system.identity.locale.enable = true;
          core.system.identity.user.enable = true;
          core.system.nix.documentation.enable = true;
          core.system.nix.nh.enable = true;
          core.system.nix.nix-index.enable = true;
          core.system.nix.nix-ld.enable = true;
          core.system.nix.nix.enable = true;
          core.system.boot.grub.enable = true;

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

          services.ai.ollama.enable = true;
          services.ai.open-webui.enable = true;
          services.containers.docker.enable = true;
          services.containers.kubernetes.kind.enable = true;
          services.containers.kubernetes.kubectl.enable = true;
          services.containers.kubernetes.minikube.enable = true;
          services.databases.postgresql.enable = true;
          services.databases.redis.enable = true;
          services.monitoring.dashy.enable = false;
          services.monitoring.glance.enable = true;
          services.server.nginx.enable = true;
          services.vpn.openvpn.enable = true;
          services.vpn.tailscale.enable = true;
          services.vpn.wireguard.enable = true;

          hardware.audio.pipewire.enable = true;
          hardware.audio.rtkit.enable = true;
          hardware.bluetooth.blueman.enable = true;
          hardware.bluetooth.bluetooth.enable = true;
          hardware.inputs.qmk.enable = true;
          hardware.inputs.via.enable = true;
          hardware.network.networkmanager.enable = true;
          hardware.power.brightnessctl.enable = true;
          hardware.power.power-management.enable = true;
          hardware.power.profiles.enable = true;
          hardware.power.thermald.enable = true;
          hardware.power.upower.enable = true;
          hardware.printing.hplip.enable = true;
          hardware.printing.printing.enable = true;
          hardware.printing.sane.enable = true;
          hardware.units.cpu.amd.enable = true;
          hardware.units.cpu.intel.enable = true;
          hardware.units.gpu.mesa.enable = true;
          hardware.units.gpu.nvidia.enable = true;
          hardware.units.gpu.opengl.enable = true;
          hardware.units.ram.zram.enable = true;
          hardware.units.storage.usb-automount.enable = true;

          apps.gaming.compatibility.proton.enable = true;
          apps.gaming.platform.gamemode.enable = true;
          apps.gaming.platform.gamescope.enable = true;
          apps.gaming.platform.steam.enable = true;
          apps.media.audio.pamixer.enable = true;
          apps.media.audio.pavucontrol.enable = true;
          apps.media.audio.playerctl.enable = true;
          apps.media.audio.pulsemixer.enable = true;
          apps.media.photo.aseprite.enable = true;
          apps.media.photo.gimp.enable = true;
          apps.media.photo.lutgen.enable = true;
          apps.media.video.ffmpeg.enable = true;
          apps.system.disk.gparted.enable = true;
          apps.system.files.analyzers.baobab.enable = true;
          apps.system.files.analyzers.ncdu.enable = true;
          apps.system.files.archives.file-roller.enable = true;
          apps.system.files.archives.p7zip.enable = true;
          apps.system.files.archives.unzip.enable = true;
          apps.system.files.managers.nautilus.enable = true;
          apps.system.monitors.mission-center.enable = true;
          apps.user.internet.browsers.chrome.enable = true;
          apps.user.internet.browsers.tor.enable = true;
          apps.user.internet.communication.telegram.enable = true;
          apps.user.internet.communication.thunderbird.enable = true;
          apps.user.internet.qbitttorrent.enable = true;
          apps.user.productivity.libreoffice.enable = true;
          apps.user.productivity.obsidian.enable = true;
          apps.user.productivity.todoist.enable = true;

          desktop.components.notifications.ntfy.enable = true;
          desktop.display-manager.gdm.enable = true;
          desktop.display.wayland.enable = true;
          desktop.display.xserver.enable = true;

          dev.editor.antigravity.enable = true;
          dev.git.git-extras.enable = true;
          dev.git.lazygit.enable = true;
          dev.runtimes.cpp.enable = true;
          dev.runtimes.javascript.nodejs.enable = true;
          dev.runtimes.javascript.prisma.enable = true;
          dev.runtimes.python.enable = true;
          dev.runtimes.rustc.enable = true;
          dev.security.attack.brute-force.hashcat.enable = true;
          dev.security.attack.brute-force.hydra.enable = true;
          dev.security.attack.brute-force.john.enable = true;
          dev.security.attack.brute-force.wordlists.enable = true;
          dev.security.attack.exploit.metasploit.enable = true;
          dev.security.attack.exploit.websploit.enable = true;
          dev.security.attack.mitm.bettercap.enable = true;
          dev.security.attack.mitm.ettercap.enable = true;
          dev.security.attack.recon.discovery.amass.enable = true;
          dev.security.attack.recon.discovery.assetfinder.enable = true;
          dev.security.attack.recon.discovery.sherlock.enable = true;
          dev.security.attack.recon.discovery.subfinder.enable = true;
          dev.security.attack.recon.web.katana.enable = true;
          dev.security.attack.recon.web.whatweb.enable = true;
          dev.security.attack.scanning.network.inetutils.enable = true;
          dev.security.attack.scanning.network.netcat.enable = true;
          dev.security.attack.scanning.network.nmap.enable = true;
          dev.security.attack.scanning.vulnability.nuclei.enable = true;
          dev.security.attack.trafic.burbsuite.enable = true;
          dev.security.attack.trafic.caido.enable = true;
          dev.security.attack.trafic.wireshark.enable = true;
          dev.security.wireless.wifite2.enable = true;
          dev.tools.db.dbeaver.enable = true;
          dev.tools.db.usql.enable = true;
          dev.tools.http.client.bruno.enable = true;
          dev.tools.http.client.hurl.enable = true;
          dev.tools.http.client.simplehttp.enable = true;
          dev.tools.http.client.xh.enable = true;
          dev.tools.http.server.ngrok.enable = true;
          dev.tools.quality.biome.enable = true;
          dev.tools.quality.deadnix.enable = true;
        };
  };
}
