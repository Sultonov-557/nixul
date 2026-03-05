{ loadTags, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/example
  ];

  nixul.host = {
    name = "example";
    timezone = "UTC";
    location = "The Moon";

    modules = lib.recursiveUpdate (loadTags [
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
    ]) {
      core.maintenance.auto-upgrade.enable = true;
      core.maintenance.garbage-collector.enable = true;
      core.maintenance.journald.enable = true;
      core.security.network.acme.enable = true;
      core.security.network.avahi.enable = true;
      core.security.network.firewall.enable = true;
      core.security.network.resolved.enable = true;
      core.security.network.unbound.enable = true;
      core.security.secrets.sops.enable = true;
      core.security.ssh.openssh.enable = true;
      core.security.ssh.ssh.enable = true;
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

      services.ai.ollama.enable = true;
      services.ai.open-webui.enable = true;
      services.containers.docker.enable = true;
      services.containers.kubernetes.kind.enable = true;
      services.containers.kubernetes.kubectl.enable = true;
      services.containers.kubernetes.minikube.enable = true;
      services.databases.postgresql.enable = true;
      services.databases.redis.enable = true;
      services.monitoring.dashy.enable = true;
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
      hardware.units.storage.udiskie.enable = true;
      hardware.units.storage.usb-automount.enable = true;
    };
  };
}