{
  ...
}:
{
  flake.modules.nixos.default =
    { ... }:
    {
      programs.tmux = {
        enable = true;
        terminal = "screen-256color";

        extraConfig = ''
          set -g base-index 1 # start windows numbering at 1

          set -g prefix2 C-s

          set -s escape-time 0
        '';
      };
    };
}
