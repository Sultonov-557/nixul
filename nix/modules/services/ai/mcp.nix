{
  lib,
  inputs,
  ...
}:
{
  home =
    { cfg, user, ... }:
    {
      imports = [ inputs.mcp-servers-nix.homeManagerModules.default ];
      programs.mcp.enable = lib.mkIf cfg.enable true;

      mcp-servers.settings.servers = lib.mkIf cfg.enable {
        obsidian = {
          enable = true;
          command = "bunx";
          args = [
            "obsidian-brain@latest"
            "server"
          ];
          env = {
            VAULT_PATH = "/home/${user}/notes";
          };
        };
      };

      mcp-servers.programs = lib.mkIf cfg.enable {
        filesystem = {
          enable = true;
          args = [ "/home/${user}" ];
        };
        fetch.enable = true;
        git.enable = true;
        github = {
          enable = true;
          passwordCommand = {
            GITHUB_PERSONAL_ACCESS_TOKEN = [
              "gh"
              "auth"
              "token"
            ];
          };
        };
        memory.enable = true;
        nixos.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable mcp";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
