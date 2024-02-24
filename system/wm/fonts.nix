{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      jetbrains-mono
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["JetBrains Mono"];
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
      };
    };
  };
}