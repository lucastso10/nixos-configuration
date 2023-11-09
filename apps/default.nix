{config, lib, pkgs, specialArgs, ...}:

{
  imports = [ 
    ./firefox.nix
    ./vim.nix
    ./kitty.nix
  ];

  # apps that require no config

  options = with lib; {

    apps.ollama = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to enable ollama
        '';
      };
    };

  };

  config  = lib.mkIf config.apps.ollama.enable {
      environment.systemPackages = [ pkgs.ollama ];
  };

}
