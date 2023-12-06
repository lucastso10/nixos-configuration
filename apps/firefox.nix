{config, lib, pkgs, ...}:

{
  options = with lib; {
    apps.firefox = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          wheter or not to enable firefox
        '';
      };
    };
  };

  config = lib.mkIf config.apps.firefox.enable {
    home-manager.users."bolofofo" = {pkgs, ...}:{
      programs.firefox = {
        enable = true;
        # gnomeExtesion = config.gnome.enable;

        policies = {
          DefaultDownloadDirectory = "\${home}/Downloads";
          ExtensionSettings.installation_mode = "allowed";
          FirefoxHome = {
            SponsoredTopSites = false;
            SponsoredPocket = false;
          };
        };

      };
    };
  };
}
