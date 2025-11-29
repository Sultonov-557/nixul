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
      settings = {
        keymap = {
          preset = "default";
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-e>" = [
            "hide"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<Tab>" = [
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };
        completion = {
          accept.auto_brackets.enabled = true;
          menu.auto_show = true;
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
            window.border = "rounded";
          };
          ghost_text.enabled = true;
        };
        signature.enabled = true;
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "emoji"
            "git"
          ];
          cmdline = [ ];
        };
      };
    };
  };
}
