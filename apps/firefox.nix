{config, lib, pkgs, ...}:

let
  myFirefox = with pkgs; wrapFirefox firefox-esr-unwrapped {
    nixExtensions = [
      (fetchFirefoxAddon {
        name = "ublock"; # Has to be unique!
        url = "https://addons.mozilla.org/firefox/downloads/file/4171020/ublock_origin-1.52.2.xpi";
        hash = "sha256-6O4/nVl6bULbnXP+h8HVId40B1X9i/3WnkFiPt/gltY=";
      }) 

      (fetchFirefoxAddon {
        name = "Purple-Night-Theme";
        url = "https://addons.mozilla.org/firefox/downloads/file/3620954/purple_night_theme-1.0.xpi";
        hash = "sha256-7PE3aXM7gOqleS0iYzrGRb/z7XtQpThrnH3eusTYXEk=";
      })
    ];

     extraPolicies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
    };
  };

in {

  options = with lib; {
    apps.firefox = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to enable firefox
        '';
      };
    };
  };

  config = lib.mkIf config.apps.firefox.enable {
    environment.systemPackages = with pkgs; [
      myFirefox
    ];
  };
}
