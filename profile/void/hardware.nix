{ config, lib, pkgs, modulesPath, ... }:

{
  # Nvidia 
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # NTFS support
  boot.supportedFilesystems = [ "ntfs" ];
}
