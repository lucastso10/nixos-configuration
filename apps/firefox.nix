{
  config,
  lib,
  inputs,
  pkgs,
  home-manager,
  ...
}:
{
  options = with lib; {
    apps.firefox = {
      enable = mkEnableOption "firefox";
    };
  };

  config = lib.mkIf config.apps.firefox.enable {
    home-manager.users."bolofofo" = {
      # TODO: find a way to get extensions
      programs.firefox = {
        enable = true;
        # gnomeExtesion = config.gnome.enable;

        policies = {
          DefaultDownloadDirectory = "\${home}/Downloads";
          FirefoxHome = {
            SponsoredTopSites = false;
            SponsoredPocket = false;
          };
        };

        profiles = {
          default = {
            id = 0;
            name = "default";
            isDefault = true;

            bookmarks = {
              force = true;
              settings = [
                {
                  name = "Nixospkgs";
                  url = "https://search.nixos.org/packages";
                  #keyword = "";
                }
                {
                  name = "Home-manager";
                  url = "https://home-manager-options.extranix.com/";
                  #keyword = "";
                }
              ];
            };

            extensions.force = true;
            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
            ];

          };
        };
      };

      stylix.targets.firefox.enable = true;
      stylix.targets.firefox.profileNames = [ "default" ];
      stylix.targets.firefox.colorTheme.enable = true;

    };
  };
}
