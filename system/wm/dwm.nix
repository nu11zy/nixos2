{ ... }:

{
  imports = [
    ./x11.nix
  ];

  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "none+dwm";
  };
  
  services.xserver.windowManager.dwm.enable = true;

  # nm-applet
  programs.nm-applet.enable = true;
}