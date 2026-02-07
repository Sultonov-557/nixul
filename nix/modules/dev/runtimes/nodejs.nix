{ pkgs, ... }:
{

  environment.defaultPackages = with pkgs; [ nodePackages_latest.nodejs ];
}
