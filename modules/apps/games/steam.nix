{
  inputs,
  ...
}:
{
  flake.modules.nixos.games =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.millennium.overlays.default ];

      environment.systemPackages = with pkgs; [
        steamtinkerlaunch
      ];

      programs.steam = {
        enable = true;
        package = pkgs.millennium-steam;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      };
      hardware.steam-hardware.enable = true;
    };
}
