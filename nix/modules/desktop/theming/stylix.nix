{ inputs, ... }:
{
  meta = {
    scope = "host";
    system = true;
    hm = true;
  };

  system = {
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix.enable = true;
  };

  home = {
    stylix.targets.nixvim.enable = false;
  };
}
