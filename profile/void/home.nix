{ pkgs, customSettings, ... }:

{
  home.username = customSettings.username;
  home.homeDirectory = "/home/"+customSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ../../user/terminal/alacritty.nix
    ../../user/shell/zsh.nix

    ../../user/app/chromium.nix
    ../../user/app/vscode.nix
    ../../user/app/thunar.nix

    ../../user/gtk.nix
  ];

  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    vlc         # video player
    bitwarden   # password manager
    ventoy-full # tool to create bootable USB
    obsidian    # note taking app
    obs-studio  # screen recorder
    flameshot   # screenshot
    onlyoffice-bin_7_5 # office tools
    gnome.gnome-disk-utility # manage disks
    appimage-run # .appimage support
    gimp        # phostoshop
    telegram-desktop # tg
    discord     # discord
    qbittorrent # torrent client
    font-manager # font manager
  ];
}
