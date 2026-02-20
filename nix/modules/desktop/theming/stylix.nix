{ inputs, ... }:
{
  meta = {
    scope = "host";
    system = true;
    hm = true;
  };

  system = _: {
    imports = [ inputs.stylix.nixosModules.stylix ];
    config = {
      stylix.enable = true;
    };
  };

  home = _: {
    stylix.targets.nixvim.enable = false;
  };
}
