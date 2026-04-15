{
  flake.nixosModules.docker = { pkgs, ... }: {

    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    environment.systemPackages = with pkgs; [
      docker-compose
    ];

  };
}
