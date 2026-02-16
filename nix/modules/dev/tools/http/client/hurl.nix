{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ hurl ];
}
