{
  lib,
  config,
  pkgs,
  home-manager,
  ...
}:

{
  options = with lib; {
    apps.alacritty = {
      enable = mkEnableOption "alacritty";
    };
  };

  config = lib.mkIf config.apps.alacritty.enable {

    home-manager.users."bolofofo" = {
      programs.alacritty = {
        enable = true;

        settings = { };
      };
    };

  };
}
