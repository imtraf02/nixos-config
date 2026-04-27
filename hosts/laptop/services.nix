{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    ensureDatabases = ["mydatabase"];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };

  services.redis.servers."" = {
    enable = true;
    # package = pkgs.redis; # package is usually global or per server, let's see. 
    # The warning only mentioned bind, port, enable.
    bind = "127.0.0.1";
    port = 6379;
  };
}
