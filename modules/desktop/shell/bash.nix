{ ... }:
{
  flake.modules.nixos.default =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
        environment.systemPackages = with pkgs; [
          btop
          killall
        ];
        programs.bash = {
          completion.enable = true;

          shellAliases = {
            top = "sudo btop";
          };
        };
      };
}
