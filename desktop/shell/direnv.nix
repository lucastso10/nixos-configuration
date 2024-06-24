{ lib, config, pkgs, ... }: {

  # direnv is used to automatically enable enviroments when moving through your system
  # to automatically enter a enviroment there has to be .envrc with the commands needed
  # if you are using a shell.nix or have a default.nix create a .envrc with just "use nix"
  config = lib.mkIf config.desktop.shell.enable {

    home-manager.users."bolofofo" = { pkgs, ... }: {
      programs = {
        direnv = {
          enable = true;
          enableBashIntegration = true; # see note on other shells below
          nix-direnv.enable = true;
        };

        bash.enable = true; # see note on other shells below
      };

    };
  };
}
