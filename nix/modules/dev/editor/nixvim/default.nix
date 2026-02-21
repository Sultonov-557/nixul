{ lib, inputs, ... }:
{
  home =
    { cfg, ... }:
    {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = lib.mkIf cfg.enable {
        enable = true;
        extraSpecialArgs = { inherit inputs; };
        defaultEditor = true;
        enableMan = true;
        imports = [
          ./options.nix
          ./keymaps.nix
          ./plugins
        ];
        withNodeJs = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nixvim";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
