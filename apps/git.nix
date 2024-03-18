{ config, lib, pkgs, home-manager, ... }:

{
  config = {
    home-manager.users."bolofofo" = {
      programs.git = {
        enable = true;
        userName = "lucastso10";
        userEmail = "lucastso10@gmail.com";
      };
    };
  };
}
