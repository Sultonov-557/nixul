{ pkgs, ... }: {
  environment.defaultPackages = with pkgs; [ todoist-electron ];
}
