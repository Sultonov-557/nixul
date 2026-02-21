{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.zsh = lib.mkIf cfg.enable {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "sudo"
            "docker"
            "kubectl"
            "aliases"
            "bun"
            "history-substring-search"
            "colored-man-pages"
          ];
          theme = "robbyrussell";
        };

        shellAliases = {
          ll = "ls -lah";
          la = "ls -A";
          l = "ls -CF";
          cat = "bat";
          find = "fd";
          grep = "rg";
        };

        initContent = ''
          eval "$(zoxide init zsh)"
        '';
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zsh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
