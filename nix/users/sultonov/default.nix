{ loadUserTags, lib, ... }:
{
  nixul = {
    aliases = import ./alias;
    primaryUser = "sultonov";
    users.sultonov = {
      email = "sultonovzerifboy@gmail.com";

      keybinds = import ./keybinds;
      bookmarks = import ./bookmarks.nix;

      modules =
        lib.recursiveUpdate
          (loadUserTags [
            "core"
            "apps"
            "desktop"
            "development"
            "desktop/components/vicinae"
            "services/ai/openclaw"
            "hardware/units/storage/udiskie"
          ])
          {
            core.security.ssh.ssh = {
              enable = true;
              serversSecretFile = ../../assets/secrets/ssh-servers.json;
            };
            apps.media.music.spicetify.enable = false;
            apps.system.terminal.foot.enable = false;
            apps.system.terminal.kitty.enable = false;
            apps.user.internet.browsers.firefox.enable = false;
            desktop.panels.caelestia.enable = false;
            desktop.wms.niri.enable = false;
            dev.editor.zed.enable = false;
            apps.user.internet.communication.thunderbird.enable = false;
            apps.user.productivity.todoist.enable = false;
          };
    };
  };
}
