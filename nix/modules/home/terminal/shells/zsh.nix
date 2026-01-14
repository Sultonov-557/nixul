{ pkgs, ... }: {
  programs.zsh = {
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
        "command-not-found"
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

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.zoxide.enable = true;

  programs.bat.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "10m";
      search_mode = "fuzzy";
    };
  };

  programs.pay-respects = {
    enable = true;
    options = [ "--alias" "f" ];
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [ ripgrep fd eza nmap ];
}
