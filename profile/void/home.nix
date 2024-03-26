{ pkgs, customSettings, ... }:

{
  home.username = customSettings.username;
  home.homeDirectory = "/home/"+customSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ../../user/shell/zsh.nix
    ../../user/app/chromium.nix
     ../../user/app/vscode.nix
    ../../user/terminal/alacritty.nix
  ];

  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    vlc
    bitwarden
  ];
}
