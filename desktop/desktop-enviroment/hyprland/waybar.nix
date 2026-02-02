{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.desktop.hyprland.enable {
    home-manager.users."bolofofo".programs.waybar = {
      enable = true;
      #systemd.enable = true;
      settings = {
        mainBar = {
          "layer" = "top";
          "modules-left" = [
            "custom/os_button"
            "hyprland/workspaces"
            "mpd"
            "sway/mode"
          ];
          "modules-center" = [ "clock" ];
          "modules-right" = [
            "network"
            "pulseaudio"
            "cpu"
            "memory"
          ];
          "mpd" = {
            "tooltip" = false;
            "format" = "{stateIcon} {artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S})";
            "format-disconnected" = "ﳌ";
            "format-stopped" = "";
            "state-icons" = {
              "playing" = "";
              "paused" = "";
            };
          };
          "pulseaudio" = {
            "tooltip" = false;
            "on-click" = "pavucontrol";
            "scroll-step" = 5;
            "format" = "{icon} {volume}%";
            "format-muted" = "󰝟 ";
            "format-icons" = {
              "default" = [
                "󰕿 "
                "󰖀 "
                "󰕾 "
              ];
            };
          };
          "network" = {
            "format-wifi" = "{icon} %{signalStrength}";
            "format-ethernet" = "󰈀 ";
            "format-disconnected" = "󰤮 ";
            "format-icons" = [
              "󰤯 "
              "󰤟 "
              "󰤢 "
              "󰤥 "
              "󰤨 "
            ];
            "tooltip" = true;
            "tooltip-format-wifi" = "{essid} {ipaddr}";
            "tooltip-format-ethernet" = "{ipaddr}";
            "on-click" = "ghostty -e nmtui";
          };
          "cpu" = {
            "tooltip" = false;
            "format" = "  {}%";
            "on-click" = "ghostty -e sudo btop";
          };
          "memory" = {
            "tooltip" = false;
            "format" = "  {}%";
            "on-click" = "ghostty -e sudo btop";
          };
          "hyprland/workspaces" = {
            "format" = "<sub>{icon} {windows}</sub>";
            "format-window-separator" = "";
            "window-rewrite" = {
              "title<.*youtube.*>" = " ";
              "title<.*github.*>" = " ";
              "class<.*zen.*>" = "󰺕 ";
              "class<firefox>" = " ";
              "ghostty" = "󰊠 ";
              "steam" = " ";
              "discord" = " ";
            };
          };
          "clock" = {
            "format" = "{:%H:%M}  ";
            "format-alt" = "{%d/%m/%y %R}  ";
            "tooltip-format" = "<tt><small>{calendar}</small></tt>";
            "calendar" = {
              "mode" = "month";
              "format" = {
                "months" = "<span color='#${config.stylix.base16Scheme.base0E}'><b>{}</b></span>";
                "days" = "<span color='#${config.stylix.base16Scheme.base0D}'><b>{}</b></span>";
                "weeks" = "<span color='#${config.stylix.base16Scheme.base0A}'><b>W{}</b></span>";
                "weekdays" = "<span color='#${config.stylix.base16Scheme.base09}'><b>{}</b></span>";
                "today" = "<span color='#${config.stylix.base16Scheme.base0F}'><b><u>{}</u></b></span>";
              };
            };
          };
          "custom/os_button" = {
            "format" = "<span color='#${config.stylix.base16Scheme.base0D}'> </span>";
            "tooltip" = false;
          };
        };
      };
      style = ''
        * {
        	border: none;
        	border-radius: 0;
        	font-size: 14px;
        	min-height: 24px;
        }

        window#waybar {
             background: transparent;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        #window {
            margin-top: 8px;
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 26px;
            color: transparent;
            background: transparent;
        }


        tooltip {
          background: rgba(43, 48, 59, 0.5);
          border: 1px solid rgba(100, 114, 125, 0.5);
        }
        tooltip label {
          color: white;
        }

        #custom-os_button {
          margin-top: 8px;
          margin-left: 8px;
          font-size: 24px;
          padding-left: 12px;
          padding-right: 12px;
          transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        #workspaces {
        	margin-top: 8px;
        	margin-left: 12px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	font-size: 16px;
        	background: #${config.stylix.base16Scheme.base00};
             border-bottom-width: 0px;
        }

        #workspaces button {
        	color: white;
        	background: transparent;
        }

        .modules-left #workspaces button.focused,
        .modules-left #workspaces button.active {
            color: #${config.stylix.base16Scheme.base0E};
            border-bottom: 0px;
        }

        #workspaces button:hover {
        	box-shadow: inherit;
        	text-shadow: inherit;
        	color: #${config.stylix.base16Scheme.base0E};
        }

        #mpd {
        	margin-top: 8px;
        	margin-left: 8px;
        	padding-left: 16px;
        	padding-right: 16px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	background: #${config.stylix.base16Scheme.base00};
        	transition: none;
        	color: #4d4d4d;
        	background: #5af78e;
        }

        #mpd.disconnected,
        #mpd.stopped {
        	color: #f8f8f2;
        	background: #282a36;
        }

        #network {
        	margin-top: 8px;
        	margin-left: 8px;
        	padding-left: 16px;
        	padding-right: 16px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	color: #${config.stylix.base16Scheme.base01};
        	background: #${config.stylix.base16Scheme.base0A};
        }

        #pulseaudio {
        	margin-top: 8px;
        	margin-left: 8px;
        	padding-left: 16px;
        	padding-right: 16px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	color: #${config.stylix.base16Scheme.base01};
        	background: #${config.stylix.base16Scheme.base0F};
        }

        #cpu {
        	margin-top: 8px;
        	margin-left: 8px;
        	padding-left: 16px;
        	padding-right: 16px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	transition: none;
        	color: #${config.stylix.base16Scheme.base01};
        	background: #${config.stylix.base16Scheme.base0D};
        }

        #memory {
        	margin-top: 8px;
        	margin-left: 8px;
        	padding-left: 16px;
        	padding-right: 16px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	transition: none;
        	color: #${config.stylix.base16Scheme.base01};
        	background: #${config.stylix.base16Scheme.base09};
        }

        #clock {
        	margin-top: 8px;
        	margin-left: 8px;
        	margin-right: 12px;
        	padding-left: 16px;
        	padding-right: 16px;
        	margin-bottom: 0;
        	border-radius: 26px;
        	transition: none;
        	color: white;
        	background: #${config.stylix.base16Scheme.base00};
        }
      '';
    };
  };
}
