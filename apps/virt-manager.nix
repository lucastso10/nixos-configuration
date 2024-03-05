{ pkgs, lib, config, ... }: {
  options = with lib; {
    apps.virt-manager = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to install virt-manager on the system
        '';
      };
    };
  };

  config = lib.mkIf config.apps.virt-manager.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
