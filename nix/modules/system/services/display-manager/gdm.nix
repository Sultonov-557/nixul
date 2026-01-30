{ pkgs, ... }: {
  services.displayManager.gdm = { enable = true; };
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [ niri ];
}
