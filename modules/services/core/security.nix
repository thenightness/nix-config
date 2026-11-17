{ lib, pkgs, ... }:

{
  security.pam.services = {
    login.fprintAuth = true;
    login.rules.auth.fprintd.settings.timeout = 99;
    gdm-password.enableGnomeKeyring = true;
    sudo.fprintAuth = true;
    polkit-1.fprintAuth = true;
  };

  services.pcscd.enable = true;

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  environment.systemPackages = with pkgs; [
    wlopm
  ];
}
