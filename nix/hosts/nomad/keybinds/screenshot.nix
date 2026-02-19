{
  nixul.keybinds = [
    {
      keys = [
        [
          "SUPER"
          "SHIFT"
          "S"
        ]
      ];
      action = "spawn";
      args.cmd = ''grim -g "$(slurp)" - | wl-copy'';
    }
  ];
}
