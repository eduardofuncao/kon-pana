{
  flake.nixosModules.venus = { config, lib, pkgs, modulesPath, ... }: {
    imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

    # TODO: replace with actual Netcup disk UUIDs
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/00000000-0000-0000-0000-000000000001";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/0000-0000";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices = [ ];

    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
