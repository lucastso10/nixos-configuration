{ lib, ... }:
{
  options = with lib; {
    desktop.shell = {
      enable = mkEnableOption "shell";
    };
  };
}
