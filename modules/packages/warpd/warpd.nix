{
  flake.nixosModules.warpd = {pkgs, ...}: {

    environment.systemPackages = with pkgs; [
      warpd
    ];

    hjem.users.eduardo = {
      files = {
        ".config/warpd/config".source = ./warpd-conf;
      };
    };

  };
}
