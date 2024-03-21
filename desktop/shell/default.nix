{ lib, ... }: {
  imports = [ ./starship.nix ./bash.nix ];

  options = with lib; { desktop.shell = { enable = mkEnableOption "shell"; }; };
}
