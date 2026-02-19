let
  resizeAmount = 20;
in
{
  nixul.keybinds = [
    {
      keys = [
        [
          "SUPER"
          "CTRL"
          "LEFT"
        ]
      ];
      action = "resize";
      args = {
        direction = "l";
        amount = resizeAmount;
      };
      repeat = true;
    }
    {
      keys = [
        [
          "SUPER"
          "CTRL"
          "RIGHT"
        ]
      ];
      action = "resize";
      args = {
        direction = "r";
        amount = resizeAmount;
      };
      repeat = true;
    }
    {
      keys = [
        [
          "SUPER"
          "CTRL"
          "UP"
        ]
      ];
      action = "resize";
      args = {
        direction = "u";
        amount = resizeAmount;
      };
      repeat = true;
    }
    {
      keys = [
        [
          "SUPER"
          "CTRL"
          "DOWN"
        ]
      ];
      action = "resize";
      args = {
        direction = "d";
        amount = resizeAmount;
      };
      repeat = true;
    }
  ];
}
