{ inputs, config, ... }: {
  imports = [ inputs.dms.nixosModules.greeter ];
  programs.dank-material-shell.greeter = {
    configHome = "/home/${config.nixul.user}/";
  };
}
