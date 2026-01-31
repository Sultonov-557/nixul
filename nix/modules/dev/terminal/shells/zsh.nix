{ pkgs, config, ... }: {

  home-manager.users.${config.nixul.user} = {
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

  };
}
