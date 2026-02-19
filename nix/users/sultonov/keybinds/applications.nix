{
  nixul.keybinds = [
    {
      keys = [
        [
          "SUPER"
          "RETURN"
        ]
      ];
      action = "spawn";
      args.cmd = "ghostty";
    }
    {
      keys = [
        [
          "SUPER"
          "E"
        ]
      ];
      action = "spawn";
      args.cmd = "nautilus";
    }
    {
      keys = [
        [
          "SUPER"
          "W"
        ]
      ];
      action = "spawn";
      args.cmd = "zen-beta";
    }
    {
      keys = [
        [
          "SUPER"
          "T"
        ]
      ];
      action = "spawn";
      args.cmd = "Telegram";
    }
    {
      keys = [
        [
          "SUPER"
          "M"
        ]
      ];
      action = "spawn";
      args.cmd = "yandex-music";
    }
    {
      keys = [
        [
          "SUPER"
          "SHIFT"
          "C"
        ]
      ];
      action = "spawn";
      args.cmd = "hyprpicker -a";
    }
    {
      keys = [
        [
          "SUPER"
          "SHIFT"
          "V"
        ]
      ];
      action = "spawn";
      args.cmd = "noctalia-shell ipc call launcher clipboard";
    }
    {
      keys = [
        [
          "SUPER"
          "SPACE"
        ]
      ];
      action = "spawn";
      args.cmd = "noctalia-shell ipc call launcher toggle";
    }
    {
      keys = [
        [
          "SUPER"
          "SHIFT"
          "L"
        ]
      ];
      action = "spawn";
      args.cmd = "noctalia-shell ipc call lockScreen lock";
    }
  ];
}
