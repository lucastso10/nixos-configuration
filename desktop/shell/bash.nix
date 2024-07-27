{
  lib,
  config,
  pkgs,
  ...
}:
{

  config = lib.mkIf config.desktop.shell.enable {
    environment.systemPackages = with pkgs; [ btop ];
    programs.bash = {
      enableCompletion = true;

      shellAliases = {
        top = "btop";
      };
    };
  };
}
