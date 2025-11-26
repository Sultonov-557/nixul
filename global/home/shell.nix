{ config, pkgs, ... }:

{
  # Shell Configuration - ZSH with powerline and tools

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    history = {
      save = 10000;
      size = 10000;
      share = true;
    };

    shellAliases = {
      docker = "podman";
      ls = "eza -a";
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      c = "clear";
      grep = "grep --color=auto";
      df = "df -h";
      du = "du -h";
    };

    initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      if [[ -r "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k-instant-prompt.zsh" ]]; then
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k-instant-prompt.zsh"
      fi

      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
      export _ZO_EXACT=1
    '';

    oh-my-zsh = {
      enable = true;
      theme = "";

      plugins = [
        "git"
        "aliases"
        "bun"
        "sudo"
        "history-substring-search"
        "colored-man-pages"
        "command-not-found"
      ];
    };
  };

  # Zoxide - smarter cd
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Zellij - terminal multiplexer
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  # Atuin - better shell history
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "10m";
      search_mode = "fuzzy";
    };
  };

  # pay-respects (f to fix last command)
  programs.pay-respects = {
    enable = true;
    enableZshIntegration = true;
  };

  # Shell packages
  home.packages = with pkgs; [
    zsh-powerlevel10k

    # Git & code tools
    git
    delta
    git-ignore
    git-secrets
    gitleaks
    pass-git-helper
    license-generator

    # Productivity
    just
    process-compose
    topgrade
    noti

    # Networking & HTTP
    curl
    wget
    xh
    aria2

    # File ops & search
    eza
    fd
    ripgrep
    bat
    sd
    duf
    ouch
    yazi
    procs

    # Monitoring
    btop
    progress
    cava

    # Fun / utility
    figlet
    macchina
    fastfetch

    # Audio & USB utils
    alsa-utils
    usbutils
  ];
}
