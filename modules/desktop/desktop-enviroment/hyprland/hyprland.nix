{ ... }:
{
  flake.modules.nixos.hyprland =
    { lib, ... }:
    {
      options = with lib; {
        desktop.hyprland = {
          modKey = mkOption {
            type = types.str;
            default = "SUPER";
            description = ''
              alters the mod key used in hyprland
            '';
          };

          monitors = mkOption {
            type = types.str;
            default = "";
            description = ''
              monitor configuration for setup
              (monitor,resolution@hertz,position,scale
              example: HDMI-A-1, 2560x1080@60, 0x0, 1)
            '';
          };

          workspaces = mkOption {
            type = types.str;
            default = "";
            description = ''
              configuration for workspaces
            '';
          };
        };
      };

      config = {
        programs.hyprland.enable = true;
      };
    };

  flake.modules.homeManager.hyprland =
    { lib, osConfig, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;

        configType = "lua";

        extraConfig = ''
          hl.config({
            input = {
              kb_layout = "br",
            },
           
            general = {
              layout = "dwindle",
              allow_tearing = false,
              col = {
                active_border = "rgba(c2c1ffe6)",
                inactive_border = "rgba(c8c5d111)",
              },
            },
           
            dwindle = {
              preserve_split = true,
              smart_split = false,
              smart_resizing = true,
            },
           
            decoration = {
              rounding = 15,
              blur = {
                enabled = true,
                xray = false,
                special = false,
                ignore_opacity = true,
                new_optimizations = true,
                popups = true,
                input_methods = true,
                size = 8,
                passes = 2,
              },
              shadow = {
                enabled = true,
                range = 20,
                render_power = 3,
                color = "rgba(353434d4)", -- $surfaced4 (surface = 131317, d4 opacity)
              },
            },
          })
           
          ${osConfig.desktop.hyprland.monitors}

          ${osConfig.desktop.hyprland.workspaces}
           
          hl.on("hyprland.start", function()
            hl.exec_cmd("systemctl --user enable --now noctalia.service")
          end)
           
          local mod = "${osConfig.desktop.hyprland.modKey}"
           
          hl.bind(mod .. " + F", hl.dsp.exec_cmd("zen"))
          hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
          hl.bind(mod .. " + Q", hl.dsp.window.close())
          hl.bind(mod .. " + E", hl.dsp.exec_cmd("noctalia msg panel-open launcher"))
          hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
          hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
           
          for i = 1, 10 do
            local key = tostring(i % 10) -- 10 vira tecla "0"
            hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
            hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }))
          end

        '';
      };
    };
}
