{
  nixul.keybinds = [
    {
      keys = [
        [
          "SUPER"
          "LEFT"
        ]
      ];
      action = "focus";
      args.direction = "l";
    }
    {
      keys = [
        [
          "SUPER"
          "DOWN"
        ]
      ];
      action = "focus";
      args.direction = "d";
    }
    {
      keys = [
        [
          "SUPER"
          "UP"
        ]
      ];
      action = "focus";
      args.direction = "u";
    }
    {
      keys = [
        [
          "SUPER"
          "RIGHT"
        ]
      ];
      action = "focus";
      args.direction = "r";
    }
  ];
}
