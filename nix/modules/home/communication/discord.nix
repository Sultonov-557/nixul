{ ... }:

{
  programs.nixcord = {
    enable = true;
    config = {
      useQuickCss = true;
      themeLinks = [ ];
      frameless = false;
    };
  };
}
