
{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.shell.enable {

  };
}
