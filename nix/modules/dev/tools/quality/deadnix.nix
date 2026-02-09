{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ deadnix ];
}
