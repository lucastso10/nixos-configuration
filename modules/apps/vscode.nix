{
  ...
}:
{
  flake.modules.nixos.vscode =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          jackmacwindows.craftos-pc
          sumneko.lua
          vscodevim.vim
        ];
      };
    };
}
