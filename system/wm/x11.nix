{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./keyring.nix
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    excludePackages = [ pkgs.xterm ];
  };
}