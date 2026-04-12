{inputs, ...}: {
  flake-file.inputs.neru = {
    url = "github:y3owk1n/neru";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.neru = {pkgs, ...}: {

    environment.systemPackages = [
      inputs.neru.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    hjem.users.eduardo = {
      files = {
        ".config/neru/config.toml".source = ./config.toml;
      };
    };

    systemd.user.services.neru = {
      enable = true;
      description = "Neru mouse emulation";
      after = [ "graphical-session.target" ];
      wantedBy = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = "${inputs.neru.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/neru launch";
        Restart = "on-failure";
        RestartSec = "2s";
      };
    };

  };
}
