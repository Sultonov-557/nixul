{ pkgs, ... }:
{
   plugins = {
    blink-cmp-dictionary.enable = true;
    blink-cmp-git.enable = true;
    blink-cmp-spell.enable = true;
    blink-copilot.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
    };
  }
}
