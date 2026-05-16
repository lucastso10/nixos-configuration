{
  ...
}:
{
  flake.modules.nixos.vscode =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vscode
      ];
    };
}
