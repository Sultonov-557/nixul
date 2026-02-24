{
  keybinds = [
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
      args.cmd = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    }
    {
      keys = [
        [ "XF86AudioPlay" ]
        [ "XF86AudioPause" ]
      ];
      action = "spawn";
      args.cmd = "playerctl play-pause";
    }
    {
      keys = [ [ "XF86AudioNext" ] ];
      action = "spawn";
      args.cmd = "playerctl next";
    }
    {
      keys = [ [ "XF86AudioPrev" ] ];
      action = "spawn";
      args.cmd = "playerctl previous";
    }
    {
      keys = [ [ "XF86AudioStop" ] ];
      action = "spawn";
      args.cmd = "playerctl stop";
    }
    {
      keys = [ [ "XF86AudioRaiseVolume" ] ];
      action = "spawn";
      args.cmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
      repeat = true;
    }
    {
      keys = [ [ "XF86AudioLowerVolume" ] ];
      action = "spawn";
      args.cmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
      repeat = true;
    }
    {
      keys = [ [ "XF86MonBrightnessUp" ] ];
      action = "spawn";
      args.cmd = "brightnessctl set +5%";
      repeat = true;
    }
    {
      keys = [ [ "XF86MonBrightnessDown" ] ];
      action = "spawn";
      args.cmd = "brightnessctl set 5%-";
      repeat = true;
    }
  ];
}
