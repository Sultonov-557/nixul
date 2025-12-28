{
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.editor.nixvim;
in
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  options.modules.editor.nixvim = {
    enable = lib.mkEnableOption "nixvim";
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      enableMan = true;
      imports = [
        ./options.nix
        ./keymaps.nix
        ./plugins
      ];

      #Language Servers
      withNodeJs = true;
    };
  };
}
