{
  ...
}:
{
  flake.modules.nixos.vr =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        sidequest
        bs-manager
      ];

      #services.monado = {
      #  enable = true;
      #  defaultRuntime = true; # Register as default OpenXR runtime
      #};
    };
}
