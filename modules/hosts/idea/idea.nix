{ inputs, self, lib, ... }: {
  flake.nixosConfigurations.idea = inputs.nixpkgs.lib.nixosSystem {

    modules = with self.nixosModules; [
      core
      idea
      desktop
      cli
      hyprland
      # kitty
      niri
      noctalia
      zen
    ];
  };

  flake.nixosModules.idea = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vim
    ];

  };
}
