{ inputs, ... }:
{
  flake.modules.homeManager.hyprland =
    { lib, ... }:
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
            source = lib.mkForce "wallpaper";

            templates = {
              builtin_ids = [
                "ghostty"
                "hyprland"
                "btop"
                "starship"
              ];
              community_ids = [
                "steam"
                "discord"
                "zen-browser"
                "neovim"
              ];
            };
          };

          wallpaper = {
            enabled = true;
            automation.enabled = true;
            default.path = "/home/bolofofo/Pictures/Wallpapers";
          };

          bar = {
            order = [ "default" ];
            default = {
              margin_ends = 10;
              margin_edge = 10;

              start = [
                "clock"
                "workspaces"
              ];
              center = [ "media" ];
              end = [
                "tray"
                "notifications"
                "clipboard"
                "volume"
                "brightness"
                "control-center"
                "session"
              ];
            };
          };
        };
      };
    };

  flake.modules.nixos.hyprland =
    { ... }:
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
          appearance = {
            scheme = "Synced";
            password_style = "random";
          };
          keyboard = {
            layout = "pt";
          };
        };
      };
    };
}
