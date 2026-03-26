{
  flake.nixosModules.desktop = { self, inputs, pkgs, ... }: {
    imports = with self.nixosModules; [
      audio
      graphics
      docker
      kanata
    ];

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        user = "greeter";
      };
    };
    environment.systemPackages = with pkgs; [
      mpv zathura imv pavucontrol
    ];

  };
}
