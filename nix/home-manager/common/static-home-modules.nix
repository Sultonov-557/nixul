{ lib, pkgs, config, osConfig, inputs, ... }:
let
  mkCfg = mod:
    let
      defaults =
        if mod ? options && mod.options != null && (mod.options._type or null) == "option" then
          (mod.options.default or { })
        else
          { };
    in
    lib.recursiveUpdate defaults { enable = true; };

  evalHome = path:
    let
      raw = import path;
      mod =
        if builtins.isFunction raw then
          raw {
            inherit lib pkgs inputs;
            config = { nixul = osConfig.nixul; };
          }
        else
          raw;
    in
    if mod ? home then
      mod.home {
        inherit lib pkgs config osConfig inputs;
        cfg = mkCfg mod;
        user = "sultonov";
        nixul = osConfig.nixul;
      }
    else
      null;
in
{
  imports = lib.filter (x: x != null) [
    (evalHome ../../modules/apps/ai/codex.nix)
    (evalHome ../../modules/apps/ai/cursor.nix)
    (evalHome ../../modules/apps/ai/gemini.nix)
    (evalHome ../../modules/apps/ai/opencode/default.nix)
    (evalHome ../../modules/apps/gaming/games/minecraft.nix)
    (evalHome ../../modules/apps/gaming/platform/lutris.nix)
    (evalHome ../../modules/apps/media/music/spicetify.nix)
    (evalHome ../../modules/apps/media/music/yandex.nix)
    (evalHome ../../modules/apps/media/video/mpv.nix)
    (evalHome ../../modules/apps/system/files/archives/zip.nix)
    (evalHome ../../modules/apps/system/files/managers/yazi.nix)
    (evalHome ../../modules/apps/system/terminal/foot.nix)
    (evalHome ../../modules/apps/system/terminal/ghostty.nix)
    (evalHome ../../modules/apps/system/terminal/kitty.nix)
    (evalHome ../../modules/apps/user/internet/browsers/firefox.nix)
    (evalHome ../../modules/apps/user/internet/browsers/zen-browser.nix)
    (evalHome ../../modules/apps/user/internet/communication/discord.nix)
    (evalHome ../../modules/apps/user/productivity/khal.nix)
    (evalHome ../../modules/core/maintenance/garbage-collector.nix)
    (evalHome ../../modules/core/security/ssh/ssh.nix)
    (evalHome ../../modules/core/terminal/shells/fish.nix)
    (evalHome ../../modules/core/terminal/shells/nushell.nix)
    (evalHome ../../modules/core/terminal/shells/zsh.nix)
    (evalHome ../../modules/core/terminal/tools/display/bat.nix)
    (evalHome ../../modules/core/terminal/tools/display/eza.nix)
    (evalHome ../../modules/core/terminal/tools/display/nix-melt.nix)
    (evalHome ../../modules/core/terminal/tools/display/vulnix.nix)
    (evalHome ../../modules/core/terminal/tools/history/atuin.nix)
    (evalHome ../../modules/core/terminal/tools/history/thefuck.nix)
    (evalHome ../../modules/core/terminal/tools/info/fastfetch.nix)
    (evalHome ../../modules/core/terminal/tools/info/lsof.nix)
    (evalHome ../../modules/core/terminal/tools/info/nix-tree.nix)
    (evalHome ../../modules/core/terminal/tools/info/tty-clock.nix)
    (evalHome ../../modules/core/terminal/tools/monitor/btop.nix)
    (evalHome ../../modules/core/terminal/tools/navigation/fzf.nix)
    (evalHome ../../modules/core/terminal/tools/navigation/zoxide.nix)
    (evalHome ../../modules/core/terminal/tools/prompt/starship.nix)
    (evalHome ../../modules/desktop/components/cliphist.nix)
    (evalHome ../../modules/desktop/components/polkit.nix)
    (evalHome ../../modules/desktop/components/screenshots.nix)
    (evalHome ../../modules/desktop/components/vicinae.nix)
    (evalHome ../../modules/desktop/components/notifications/mako.nix)
    (evalHome ../../modules/desktop/panels/caelestia/default.nix)
    (evalHome ../../modules/desktop/panels/noctalia/default.nix)
    (evalHome ../../modules/desktop/theming/default.nix)
    (evalHome ../../modules/desktop/wms/hyprland/default.nix)
    (evalHome ../../modules/desktop/wms/niri/default.nix)
    (evalHome ../../modules/dev/editor/zed.nix)
    (evalHome ../../modules/dev/editor/nixvim/default.nix)
    (evalHome ../../modules/dev/git/git.nix)
    (evalHome ../../modules/dev/git/github.nix)
    (evalHome ../../modules/dev/git/worktrunk.nix)
    (evalHome ../../modules/dev/multiplexers/zellij/default.nix)
    (evalHome ../../modules/dev/runtimes/javascript/bun.nix)
    (evalHome ../../modules/dev/runtimes/javascript/yarn.nix)
    (evalHome ../../modules/dev/security/attack/brute-force/wordlists.nix)
    (evalHome ../../modules/dev/security/scanning/network/nmap.nix)
    (evalHome ../../modules/dev/security/trafic/wireshark.nix)
    (evalHome ../../modules/dev/tools/containers/lazydocker.nix)
    (evalHome ../../modules/dev/tools/env/devenv.nix)
    (evalHome ../../modules/dev/tools/env/direnv.nix)
    (evalHome ../../modules/dev/tools/env/nix-init.nix)
    (evalHome ../../modules/hardware/units/storage/udiskie.nix)
    (evalHome ../../modules/services/ai/litellm.nix)
  ];
}
