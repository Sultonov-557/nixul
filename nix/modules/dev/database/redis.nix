{ ... }: {

  services.redis.servers."" = {
    enable = true;
    port = 6379;
    bind = "127.0.0.1";
  };
}
