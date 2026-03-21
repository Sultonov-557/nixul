{ lib, pkgs, config, osConfig, inputs, ... }:
let
  mkCfg = mod:
    let
      defaults = if mod ? options && mod.options != null && (mod.options._type or null) == "option" then (mod.options.default or { }) else { };
    in
    lib.recursiveUpdate defaults { enable = true; };

  adapt = path:
    let
      raw = import path;
      mod = if builtins.isFunction raw then raw { inherit lib pkgs inputs; config = { nixul = osConfig.nixul; }; } else raw;
    in
    if mod ? home then
      mod.home { inherit lib pkgs config osConfig inputs; cfg = mkCfg mod; user = "sultonov"; nixul = osConfig.nixul; }
    else
      null;
in
{
  imports = lib.filter (x: x != null) [
    (adapt ../../modules/apps/ai/codex.nix)
    (adapt ../../modules/apps/ai/cursor.nix)
    (adapt ../../modules/apps/ai/gemini.nix)
    (adapt ../../modules/apps/gaming/games/minecraft.nix)
    (adapt ../../modules/apps/gaming/platform/lutris.nix)
    (adapt ../../modules/apps/media/music/spicetify.nix)
    (adapt ../../modules/apps/media/music/yandex.nix)
    (adapt ../../modules/apps/media/video/mpv.nix)
    (adapt ../../modules/apps/system/files/archives/zip.nix)
    (adapt ../../modules/apps/system/files/managers/yazi.nix)
    (adapt ../../modules/apps/system/terminal/foot.nix)
    (adapt ../../modules/apps/system/terminal/ghostty.nix)
    (adapt ../../modules/apps/system/terminal/kitty.nix)
    (adapt ../../modules/apps/user/internet/browsers/firefox.nix)
    (adapt ../../modules/apps/user/internet/browsers/zen-browser.nix)
    (adapt ../../modules/apps/user/internet/communication/discord.nix)
    (adapt ../../modules/apps/user/productivity/khal.nix)
    (adapt ../../modules/core/maintenance/garbage-collector.nix)
    (adapt ../../modules/core/security/ssh/ssh.nix)
    (adapt ../../modules/core/terminal/shells/fish.nix)
    (adapt ../../modules/core/terminal/shells/nushell.nix)
    (adapt ../../modules/core/terminal/shells/zsh.nix)
    (adapt ../../modules/core/terminal/tools/display/bat.nix)
    (adapt ../../modules/core/terminal/tools/display/eza.nix)
    (adapt ../../modules/core/terminal/tools/display/nix-melt.nix)
    (adapt ../../modules/core/terminal/tools/display/vulnix.nix)
    (adapt ../../modules/core/terminal/tools/history/atuin.nix)
    (adapt ../../modules/core/terminal/tools/history/thefuck.nix)
    (adapt ../../modules/core/terminal/tools/info/fastfetch.nix)
    (adapt ../../modules/core/terminal/tools/info/lsof.nix)
    (adapt ../../modules/core/terminal/tools/info/nix-tree.nix)
    (adapt ../../modules/core/terminal/tools/info/tty-clock.nix)
    (adapt ../../modules/core/terminal/tools/monitor/btop.nix)
    (adapt ../../modules/core/terminal/tools/navigation/fzf.nix)
    (adapt ../../modules/core/terminal/tools/navigation/zoxide.nix)
    (adapt ../../modules/core/terminal/tools/prompt/starship.nix)
    (adapt ../../modules/desktop/components/cliphist.nix)
    (adapt ../../modules/desktop/components/notifications/mako.nix)
    (adapt ../../modules/desktop/components/polkit.nix)
    (adapt ../../modules/desktop/components/screenshots.nix)
    (adapt ../../modules/desktop/components/vicinae.nix)
    (adapt ../../modules/desktop/theming/catppuccin-mocha.nix)
    (adapt ../../modules/desktop/theming/gruvbox-material.nix)
    (adapt ../../modules/desktop/theming/rose-pine.nix)
    (adapt ../../modules/dev/editor/zed.nix)
    (adapt ../../modules/dev/git/git.nix)
    (adapt ../../modules/dev/git/github.nix)
    (adapt ../../modules/dev/git/worktrunk.nix)
    (adapt ../../modules/dev/runtimes/javascript/bun.nix)
    (adapt ../../modules/dev/runtimes/javascript/yarn.nix)
    (adapt ../../modules/dev/security/attack/brute-force/wordlists.nix)
    (adapt ../../modules/dev/security/scanning/network/nmap.nix)
    (adapt ../../modules/dev/security/trafic/wireshark.nix)
    (adapt ../../modules/dev/tools/containers/lazydocker.nix)
    (adapt ../../modules/dev/tools/env/devenv.nix)
    (adapt ../../modules/dev/tools/env/direnv.nix)
    (adapt ../../modules/dev/tools/env/nix-init.nix)
    (adapt ../../modules/hardware/units/storage/udiskie.nix)
    (adapt ../../modules/services/ai/litellm.nix)
  ];
}
