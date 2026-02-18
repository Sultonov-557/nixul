{
  nixul.keybinds = [
    {
      keys = [
        [ "XF86AudioMute" ]
        [
          "SUPER"
          "SHIFT"
          "M"
        ]
      ];
      action = "spawn";
      cmd = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    }
  ];
}
