{ ... }:

{
  services.mako = {
    enable = true;

    backgroundColor = "#F5F5F5E6";
    textColor = "#1E1E1E";
    borderColor = "#007AFF";
    progressColor = "over #007AFF";

    borderRadius = 10;
    borderSize = 2;

    width = 350;
    height = 100;
    margin = "10";
    padding = "15";

    defaultTimeout = 5000;

    font = "Inter 11";

    anchor = "top-right";

    layer = "overlay";

    extraConfig = ''
      [urgency=high]
      border-color=#FF3B30
      default-timeout=0
    '';
  };
}
