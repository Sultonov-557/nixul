{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          tmux
          tmuxp
        ]
      );

      programs.tmux = lib.mkIf cfg.enable {
        enable = true;
        clock24 = true;
        keyMode = "vi";
        shortcut = "g";
        baseIndex = 1;
      };
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          tmux
        ]
      );

      programs.tmux = lib.mkIf cfg.enable {
        enable = true;
        clock24 = true;
        terminal = "screen-256color";
        keyMode = "vi";
        shortcut = "g";
        baseIndex = 1;
        mouse = true;
        tmuxinator.enable = true;

        extraConfig = ''
          # reload config
          bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

          # disable noisy defaults
          set -g status on
          set -g status-interval 5

          # clean bar
          set -g status-left ""
          set -g status-right ""
          set -g status-justify left

          # reduce visual clutter
          set -g status-style bg=default

          # Switch windows with Ctrl+Shift+Arrows
          bind -n C-S-Left  previous-window
          bind -n C-S-Right next-window

          # New "tab"
          bind -n C-S-t new-window

          # Kill current "tab"
          bind -n C-S-w kill-window

          set -g status-position top

          bind C new-session
        '';

        plugins = with pkgs.tmuxPlugins; [
          sensible
          resurrect
          continuum
          tmux-sessionx
          dotbar
          tmux-fzf
          {
            plugin = tmux-sessionx;
            extraConfig = ''
              set -g @sessionx-bind 'o'
            '';
          }
          {
            plugin = continuum;
            extraConfig = ''
              set -g @continuum-restore 'on'
              set -g @continuum-save-interval '1'
            '';
          }
          {
            plugin = resurrect;
            extraConfig = ''
              set -g @resurrect-capture-pane-contents 'on'
            '';
          }
        ];

      };

    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable tmux";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
