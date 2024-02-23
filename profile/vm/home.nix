{ pkgs, customSettings, ... }:

{
  home.username = customSettings.username;
  home.homeDirectory = "/home/"+customSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ../../user/shell/bash.nix
  ];

  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    neofetch
  ];
}