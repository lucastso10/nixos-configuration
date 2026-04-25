{ inputs, config, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  home = {
    username = "bolofofo";
    homeDirectory = "/home/bolofofo";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  gtk.gtk4.theme = null;

  programs.git.signing.format = null;

  programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
