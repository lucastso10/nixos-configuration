{config, lib, pkgs, ...}:

let
  myFirefox = with pkgs; wrapFirefox firefox-esr-unwrapped {
    nixExtensions = [
      (fetchFirefoxAddon {
        name = "ublock"; # Has to be unique!
        url = "https://addons.mozilla.org/firefox/downloads/file/4171020/ublock_origin-1.52.2.xpi";
        hash = "sha256-2e73AbmYZlZXCP5ptYVcFjQYdjDp4iPoEPEOSCVF5sA=";
      }) 

      (fetchFirefoxAddon {
        name = "Purple-Night-Theme";
        url = "https://addons.mozilla.org/firefox/downloads/file/3620954/purple_night_theme-1.0.xpi";
        hash = "sha256-9e00b84ff5b5976e4670726c6b0125e094c82f07";
      })
    ];

     extraPolicies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
    };
  };

in {
  environment.systemPackages = with pkgs; [
    myFirefox
  ];
}
