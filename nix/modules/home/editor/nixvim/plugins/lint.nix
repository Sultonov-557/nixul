{ lib, pkgs, ... }: {
  plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        bash = [ "shellcheck" ];
        markdown = [ "vale" ];
        go = [ "golangcilint" ];
        dockerfile = [ "hadolint" ];
        lua = [ "luacheck" ];
        nix = [ "deadnix" "nix" ];
        python = [ "pylint" ];
        sh = [ "shellcheck" ];
        yaml = [ "yamllint" ];
      };

      linters = {
        deadnix = { cmd = lib.getExe pkgs.deadnix; };
        golangcilint = { cmd = lib.getExe pkgs.golangci-lint; };
        luacheck = { cmd = lib.getExe pkgs.luaPackages.luacheck; };
        # markdownlint = {
        #   cmd = lib.getExe pkgs.markdownlint-cli;
        # };
        pylint = { cmd = lib.getExe pkgs.pylint; };
        shellcheck = { cmd = lib.getExe pkgs.shellcheck; };
        statix = { cmd = lib.getExe pkgs.statix; };
        yamllint = { cmd = lib.getExe pkgs.yamllint; };
      };
    };
  };
}
