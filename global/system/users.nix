{ pkgs, ... }:

{
  # User Configuration

  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxsf"
      "docker"
      "podman"
      "kvm"
      "libvirtd"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
