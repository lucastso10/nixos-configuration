{
  ...
}:
{
  flake.modules.nixos.vr =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        bs-manager
      ];

      services.wivrn = {
        enable = true;
        openFirewall = true;
        autoStart = true;
      };
    };
}
