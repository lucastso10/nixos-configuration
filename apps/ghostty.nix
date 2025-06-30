{
  lib,
  config,
  ...
}:

{
  options = with lib; {
    apps.ghostty = {
      enable = mkEnableOption "ghostty";
    };
  };

  config = lib.mkIf config.apps.ghostty.enable {

    home-manager.users."bolofofo" = {
      programs.ghostty = {
        enable = true;
        #settings = {
        #};
      };
    };

  };
}
