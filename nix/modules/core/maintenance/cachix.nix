{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ cachix ];

  nix.settings = {
    substituters = [
      "https://sultonov557.cachix.org"
    ];
    trusted-public-keys = [
      "sultonov557.cachix.org-1:y1t7NYl02YaxH0I2I+kH7tkQi9Wah/8LnSY3tUIZrYM="
    ];
  };
}
