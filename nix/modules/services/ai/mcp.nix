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

      mcp-servers.programs = lib.mkIf cfg.enable {
        filesystem = {
          enable = true;
          args = [ "/home/${user}" ];
        };
        fetch.enable = true;
        clickup.enable = true;
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
        sequential-thinking.enable = true;
        context7.enable = true;
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
