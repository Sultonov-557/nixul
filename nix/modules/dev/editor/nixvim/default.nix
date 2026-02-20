{ inputs }:
{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { ... }:
    {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
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
}
