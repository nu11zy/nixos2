{ lib, pkgs, pkgs-stable, customSettings, home-manager, ... }:

{
  imports = [
    ../../hardware-configuration.nix
    home-manager.nixosModules.home-manager


  ];

  # ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${customSettings.username} = import ./home.nix;
    extraSpecialArgs = {
      inherit pkgs;
      inherit pkgs-stable;
      inherit customSettings;
    };
  };

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
    LC_ADDRESS = customSettings.extraLocale;
    LC_IDENTIFICATION = customSettings.extraLocale;
    LC_MEASUREMENT = customSettings.extraLocale;
    LC_MONETARY = customSettings.extraLocale;
    LC_NAME = customSettings.extraLocale;
    LC_NUMERIC = customSettings.extraLocale;
    LC_PAPER = customSettings.extraLocale;
    LC_TELEPHONE = customSettings.extraLocale;
    LC_TIME = customSettings.extraLocale;
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
    nano
    wget

  ];

  # default shell (zsh)
  # environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.sh;
  # programs.zsh.enable = true;

  # version
  system.stateVersion = "22.11";
}