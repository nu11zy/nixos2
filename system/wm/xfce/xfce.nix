{ pkgs, ... }:

{
  imports = [
    ../x11.nix
    ../fonts.nix
    ../pipewire.nix
    ../keyring.nix
  ];

  services.xserver = {
    displayManager = {
      lightdm = {
        enable = true;
        greeters.tiny.enable = true;
      };
      defaultSession = "xfce";
    };
    desktopManager.xfce.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.file-roller
    pavucontrol
    xclip
    xcolor
    lxappearance
    xfce.xfce4-panel
    xfce.xfce4-notifyd
    xfce.xfce4-xkb-plugin
    xfce.xfce4-sensors-plugin
    xfce.xfce4-docklike-plugin
    xfce.xfce4-datetime-plugin
    xfce.xfce4-time-out-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
  ];
}
