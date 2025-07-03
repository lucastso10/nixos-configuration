{
  lib,
  config,
  ...
}:
{
  # direnv is used to automatically enable enviroments when moving through your system
  # to automatically enter a enviroment there has to be .envrc with the commands needed
  # if you are using a shell.nix or have a default.nix create a .envrc with just "use nix"
  #
  # for this to work you have to make sure direnv is hooked to the shell
  # run this command to hook it:
  # eval "$(direnv hook bash)"
  config = lib.mkIf config.desktop.shell.enable {
    home-manager.users."bolofofo" =
      { ... }:
      {
        programs = {
          direnv = {
            enable = true;
            enableBashIntegration = true;
            nix-direnv.enable = true;
          };

          bash.enable = true;
        };
      };
  };
}
