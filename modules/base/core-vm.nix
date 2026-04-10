{
  flake.nixosModules.core-vm = {
    users.groups.vm = { };
    users.users.vm = {
      isSystemUser = true;
      initialPassword = "test";
      group = "vm";
    };
  };
}
