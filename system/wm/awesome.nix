{ ... }:

{
  imports = [
    ./x11.nix
  ];

  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "none+awesome";
  };
  
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.windowManager.awesome.noArgb = true;

  programs.nm-applet.enable = true;
}