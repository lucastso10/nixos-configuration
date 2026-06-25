{
  ...
}:
{
  flake.modules.nixos.vscode =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
      };
    };
}
