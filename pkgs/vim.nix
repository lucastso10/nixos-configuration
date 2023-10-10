{ config, lib, pkgs, ...}:

{
  programs.neovim = {
    viAlias = true;
    vimAlias = true;

    enable = true;
    defaultEditor = true;
    
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ vim-nix ];
      };
    };
  };
}
