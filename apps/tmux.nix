{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.tmux = {
      enable = mkEnableOption "tmux";
    };
  };

  config = lib.mkIf config.apps.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";

      extraConfig = ''
        set -g base-index 1 # start windows numbering at 1

        set -g prefix2 C-s
      '';
    };
  };
}
