{ inputs, ... }:
{
  flake.modules.homeManager.hyprland =
    { ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;

        settings = {
          # This may also be a string or path to a .toml file.
          theme = {
            mode = "dark";
            source = "wallpaper";
          };

          wallpaper = {
            enabled = true;
            default.path = "/home/bolofofo/Pictures/Wallpapers";
          };
        };
      };
    };

  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default
      ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;

        # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
        recommendedServices.enable = true;
      };

      programs.noctalia-greeter = {
        enable = true;

        # Optional configuration
        greeter-args = "";
        settings = {
          cursor = {
            theme = "Bibata-Modern-Ice";
            size = 24;
            path = "${pkgs.bibata-cursors}/share/icons";
          };
          keyboard = {
            layout = "us";
          };
        };
      };
    };
}
