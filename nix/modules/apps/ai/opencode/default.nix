{ lib, ... }:
let
  settings = import ./settings.nix;
  skillDir = ./skills;
  skillFolders = builtins.attrNames (
    lib.filterAttrs (
      name: type:
      let
        folderEntries = builtins.readDir (skillDir + "/${name}");
      in
      type == "directory"
      && folderEntries ? "SKILL.md"
      && folderEntries."SKILL.md" == "regular"
    ) (builtins.readDir skillDir)
  );
  skillConfig = builtins.listToAttrs (
    map (
      folder:
      {
  metadata = {
    name = "opencode";
    description = "Module for `apps.ai.opencode`.";
    purpose = "Configure `apps.ai.opencode` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "ai"
      "opencode"
    ];
  };

        name = "opencode/skills/${folder}/SKILL.md";
        value.text = builtins.readFile (skillDir + "/${folder}/SKILL.md");
      }
    ) skillFolders
  );
in
{
  home =
    { cfg, ... }:
    {
      programs.opencode = lib.mkIf cfg.enable ({
        enable = true;

        inherit settings;
      });

      xdg.configFile = skillConfig;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable opencode";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
