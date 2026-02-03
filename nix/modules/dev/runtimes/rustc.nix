{ pkgs, config, ... }: {

  environment.defaultPackages = with pkgs; [ rustc ];
}
