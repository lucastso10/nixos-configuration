{ ... }:
{
  flake.modules.nixos.default =
    {
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
