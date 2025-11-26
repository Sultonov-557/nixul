{ config, pkgs, ... }:

{
  # Git Configuration

  programs.git = {
    enable = true;
    userName = "sultonov";
    userEmail = "sultonovzerifboy@gmail.com";
  };
}
