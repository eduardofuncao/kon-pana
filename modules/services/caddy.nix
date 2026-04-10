{
  flake.nixosModules.caddy = {
    services.caddy = {
      enable = true;
      virtualHosts."http://:80".extraConfig = ''
        respond "Hello from Venus"
      '';
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
