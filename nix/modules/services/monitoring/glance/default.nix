{
  config,
  lib,
  ...
}:
{
  imports = [
    ./settings.nix
  ];

  services = {
    glance = {
      enable = true;
    };
  };

}
