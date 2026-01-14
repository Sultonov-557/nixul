{ inputs, ... }: {
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    config = {
      useQuickCss = true;
      themeLinks = [ ];
      frameless = false;
    };
  };
}
