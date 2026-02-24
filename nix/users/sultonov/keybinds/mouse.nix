{
  keybinds = [
    {
      keys = [
        [
          "SUPER"
          "mouse:272"
        ]
      ];
      raw = {
        hyprland = "movewindow";
      };
      mouse = true;
    }
    {
      keys = [
        [
          "SUPER"
          "mouse:273"
        ]
        [
          "SUPER"
          "SHIFT"
          "mouse:272"
        ]
      ];
      action = "spawn";
      raw = {
        hyprland = "resizewindow";
      };
      mouse = true;
    }
  ];
}
