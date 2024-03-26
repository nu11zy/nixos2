{ pkgs, ... }:

{
  imports = [
    ../x11.nix
    ../fonts.nix
  ];

  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "xfce";
  };

  services.xserver.desktopManager.xfce.enable = true;
}
