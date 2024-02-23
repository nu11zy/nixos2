{ lib, pkgs, customSettings, ... }:

{
  imports = [
    ../../hardware-configuration.nix
  ];

  # ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # bootloader
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # networking
  networking.hostName = customSettings.hostname;
  networking.networkmanager.enable = true;

  # timezone and locale
  time.timeZone = customSettings.timezone;
  i18n.defaultLocale = customSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = customSettings.regionFormat;
    LC_IDENTIFICATION = customSettings.regionFormat;
    LC_MEASUREMENT = customSettings.regionFormat;
    LC_MONETARY = customSettings.regionFormat;
    LC_NAME = customSettings.regionFormat;
    LC_NUMERIC = customSettings.regionFormat;
    LC_PAPER = customSettings.regionFormat;
    LC_TELEPHONE = customSettings.regionFormat;
    LC_TIME = customSettings.regionFormat;
  };

  # user account
  users.users.${customSettings.username} = {
    isNormalUser = true;
    description = customSettings.username;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    uid = 1000;
  };

  # system packages
  environment.systemPackages = with pkgs; [
    git
  ];

  # default shell (bash)
  environment.shells = with pkgs; [ bash ];
  users.defaultUserShell = pkgs.bash;

  # version
  system.stateVersion = "22.11";
}