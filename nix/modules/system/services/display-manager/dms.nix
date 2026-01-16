{ inputs, osConfig, ... }: {
  imports = [ inputs.dms.nixosModules.greeter ];
  programs.dank-material-shell.greeter = {
    configHome = "/home/${osConfig.nixul.user}/";
  };
}
