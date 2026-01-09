{ ... }:

{
  modules = {
    ai = {
      gemini.enable = true;
      cursor.enable = true;
    };
    editor = {
      nixvim.enable = true;
      ide.antigravity.enable = true;
    };
    terminal = {
      shells.zsh.enable = true;
      vcs.git.enable = true;
      emulators = {
        kitty.enable = true;
        foot.enable = true;
        ghostty.enable = true;
      };
      env.direnv.enable = true;
      runtime.bun.enable = true;
      container.lazydocker.enable = true;
      multiplexers.zellij.enable = true;
    };
    desktop = {
      wms = {
        niri.enable = true;
        hyprland.enable = false;
      };
      services = {
        audio.enable = true;
        cliphist.enable = true;
        notifications.enable = true;
        udiskie.enable = true;
      };
      tools.screenshots.enable = true;
    };
    apps = {
      browsers.firefox.enable = true;
      communication = {
        discord.enable = true;
        telegram.enable = true;
        thunderbird.enable = true;
      };
      productivity = {
        libreoffice.enable = true;
        obsidian.enable = true;
        khal.enable = true;
        todoist.enable = true;
      };
      gaming.minecraft.enable = true;
    };
    utils = {
      files = {
        archives.enable = true;
        documents.enable = true;
      };
      media = {
        mpv.enable = true;
        spicetify.enable = true;
        yandex.enable = true;
      };
      database.dbeaver.enable = true;
      graphics.gimp.enable = true;
      system = {
        baobab.enable = true;
        btop.enable = true;
        mission-center.enable = true;
      };
    };
  };

  imports =
    [ ./home/stylix.nix ./home/nixvim.nix ./home/DMShell.nix ./home/niri.nix ];
}
