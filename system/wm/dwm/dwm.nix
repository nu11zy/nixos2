{ pkgs, ... }:

{
  imports = [
    ../x11.nix
  ];

  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "none+dwm";
  };
  
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ./src;
  };

  # nm-applet
  programs.nm-applet.enable = true;
}