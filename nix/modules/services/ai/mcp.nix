{
  lib,
  inputs,
  ...
}:
{
  home =
    { cfg, ... }:
    {
      imports = [ inputs.mcp-servers-nix.homeManagerModules.default ];
      programs.mcp.enable = lib.mkIf cfg.enable true;

      mcp-servers.programs = lib.mkIf cfg.enable {
        clickup.enable = true;
        context7.enable = true;
        deepl.enable = true;
        everything.enable = true;
        fetch.enable = true;
        filesystem.enable = true;
        git.enable = true;
        github.enable = true;
        memory.enable = true;
        nixos.enable = true;
        sequential-thinking.enable = true;
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
