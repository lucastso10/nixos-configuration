{
  ...
}:
{
  flake.modules.nixos.games =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        steamtinkerlaunch
      ];

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      };
      hardware.steam-hardware.enable = true;
    };
}
