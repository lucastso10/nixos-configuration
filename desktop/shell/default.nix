{ lib, ... }:
{
  imports = [
    ./starship.nix
    ./bash.nix
    ./direnv.nix
  ];

  options = with lib; {
    desktop.shell = {
      enable = mkEnableOption "shell";
    };
  };
}
