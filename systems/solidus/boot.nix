{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules =
        [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "" ];
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    loader = {
      efi = { canTouchEfiVariables = true; };

      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        theme = pkgs.nixos-grub2-theme;
      };

    };
  };
}
