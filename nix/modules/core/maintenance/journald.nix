{
  services.journald.extraConfig = ''
    SystemMaxUse=1G
    SystemKeepFree=2G
    RuntimeMaxUse=256M
    MaxRetentionSec=30day
    Compress=yes
    Seal=yes
  '';

}
