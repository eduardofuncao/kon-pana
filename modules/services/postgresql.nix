{
  flake.nixosModules.postgresql = { pkgs, lib, ... }: {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_16;
      ensureDatabases = [ "app" ];
      ensureUsers = [
        {
          name = "eduardo";
          ensureClauses.superuser = true;
        }
      ];
      authentication = lib.mkOverride 10 ''
        local all all trust
        host  all all 127.0.0.1/32 trust
        host  all all ::1/128 trust
      '';
    };

    networking.firewall.allowedTCPPorts = [ 5432 ];
  };
}
