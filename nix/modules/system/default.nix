{ lib, ... }: {
  options.nixul.user = lib.mkOption {
    type = lib.types.str;
    description = "The primary user of the system";
  };

  imports = [ ./programs ./hardware ./software ./services ];
}
