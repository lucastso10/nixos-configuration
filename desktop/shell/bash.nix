{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.desktop.shell.enable {
    environment.systemPackages = with pkgs; [
      btop
      killall
    ];
    programs.bash = {
      completion.enable = true;

      shellAliases = {
        top = "sudo btop";
      };
    };
  };
}
