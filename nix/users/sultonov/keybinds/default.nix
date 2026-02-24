let
  applications = import ./applications.nix;
  focus = import ./focus.nix;
  media = import ./media.nix;
  mouse = import ./mouse.nix;
  moveWindow = import ./move-window.nix;
  resize = import ./resize.nix;
  screenshot = import ./screenshot.nix;
  windowManagement = import ./window-management.nix;
  workspaces = import ./workspaces.nix;
in
applications.keybinds
++ focus.keybinds
++ media.keybinds
++ mouse.keybinds
++ moveWindow.keybinds
++ resize.keybinds
++ screenshot.keybinds
++ windowManagement.keybinds
++ workspaces.keybinds
