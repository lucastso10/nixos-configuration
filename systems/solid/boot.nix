{ config, lib, pkgs, ... }:

{
  boot = {
    initrd.availableKernelModules =
      [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    initrd.kernelModules = [ ];

    kernelParams = [ "quiet" ];

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
