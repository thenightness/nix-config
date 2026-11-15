{
  inputs,
  pkgs,
  self,
  ...
}:

{
  imports = with self.modules; [
    ./hardware-config.nix
    ../../spec.nix

    services.core.power
    services.gui.igpu
    services.media.miracast
    apps.creative."3d"
    system.rescue
    system.suspend-then-hibernate

    ../../profiles/general.nix
    ../../profiles/system.nix
    ../../profiles/services.nix
    ../../profiles/apps.nix
  ];

  hostSpec = {
    hostname = "gundolf";
    users = [
      inputs.nix-secrets.users.andre
      {
        username = "root";
        secrets_user = "root";
      }
    ];
  };
}
