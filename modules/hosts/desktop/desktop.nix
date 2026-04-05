{ inputs, self, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
    ];
  };


  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = with self.nixosModules; [
      hjem
      stylix

      # services
      audio
      graphics
      greetd
      docker
      vicinae

      # packages
      core
      cli
      niri
      noctalia

      kitty
      tmux
      neovim
      squix
      viewers
      zen

      editing
      programming
    ];

  };
}
