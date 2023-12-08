{ lib, config, pkgs, ... }: 
{
  home = {
    username = "bolofofo";
    homeDirectory = "/home/bolofofo";
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName  = "lucastso10";
    userEmail = "lucastso10@gmail.com";
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
