{
  services.caddy = {
    enable = true;

    virtualHosts."api.local.sul".extraConfig = ''
      reverse_proxy localhost:3000
    '';
  };
}
