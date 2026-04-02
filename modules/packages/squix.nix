{inputs, ...}: {
  flake-file.inputs.squix = {
    url = "github:eduardofuncao/squix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.squix = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.squix.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
