{ pkgs, lib, config, ... }: {
  options = with lib; {
    apps.virt-manager = {
      enable = mkEnableOption "virt-manager";
    };
  };

  config = lib.mkIf config.apps.virt-manager.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
