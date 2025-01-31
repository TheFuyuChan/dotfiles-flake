{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: with lib; let
  cfg = config.features.desktop.waybar;
in {
  options.features.desktop.waybar.enable = mkEnableOption "enables waybar";
  config = mkIf cfg.enable {
  home.packages = [
    pkgs.waybar
    pkgs.pamixer
  ];

  programs = {
    waybar = {
      enable = true;
      #FIXME: Stylix
      style = ''
        * { all: initial; }
         * {
            border: none;
            border-radius: 0;
            font-family: NotoSansMono Nerd Font, monospace;
            font-weight: bold;
            font-size: 16px;
            min-height: 0;
        }

        window#waybar {
            background: rgba(21, 18, 27, 0);
            color: #${config.lib.stylix.colors.base07};
            border-radius: 10px;
        }

        #workspaces button {
            padding: 5px;
            color: #${config.lib.stylix.colors.base05};
            margin-right: 5px;
        }

        #workspaces button.active {
            color: #${config.lib.stylix.colors.base09};
        }

        #workspaces button.focused {
            color: #${config.lib.stylix.colors.base08};
            background: #${config.lib.stylix.colors.base00};
            border-radius: 10px;
        }

        #workspaces button.urgent {
            color: #${config.lib.stylix.colors.base10};
            background: #${config.lib.stylix.colors.base01};
            border-radius: 10px;
        }

        #workspaces button:hover {
            background: #${config.lib.stylix.colors.base00};
            color: #${config.lib.stylix.colors.base05};
            border-radius: 10px;
        }

        #workspaces {
            background: #${config.lib.stylix.colors.base00};
            border-radius: 10px;
            margin-left: 10px;
            padding-right: 0px;
            padding-left: 5px;
            font-family: Zen Maru Gothic;
            font-weight: bold;
            font-size: 16px;
        }



        #custom-notification{
            border-radius: 0 10px 10px 0;
                }

        #custom-clipboard,
        #custom-notification,
        #custom-weather,
        #window,
        #clock,
        #pulseaudio,
        #battery,
        #network,
        #workspaces,
        #tray,
        #network.vpn,
        #network.wifi,
        #network.ethernet,
        #network.disconnected,
        #backlight {
            background: #${config.lib.stylix.colors.base00};
            padding: 0px 10px;
            margin: 3px 0px;
            margin-top: 10px;
        }
        #workspaces{
            margin: 3px 10px;
            margin-top: 10px;
                }

        #tray,
        #custom-notification {
            border-radius: 10px;
            margin-right: 10px;
        }



        #custom-updates,
        #custom-notification,
        #custom-clipboard {
            color: @color7;
                }

        #custom-updates {
            border-radius: 10px 0px 0px 10px;
            border-left: 0px;
            border-right: 0px;
        }

        #window {
            border-radius: 10px;
            margin-left: 60px;
            margin-right: 60px;
        }

        #clock {
            color: #${config.lib.stylix.colors.base05};
            border-radius: 10px 10px 10px 10px;
            margin-left: 5px;
            border-right: 0px;
        }

        #network {
            color: @color9;
            border-left: 0px;
            border-right: 0px;
        }

        #pulseaudio {
            color: #${config.lib.stylix.colors.base09};
            border-left: 0px;
            border-right: 0px;
            border-radius: 0px 0px 0px 0px;
        }


        #battery {
            color: @color9;
            border-radius: 10px 0px 0px 10px;
            border-right: 0px;
        }
        #custom-notification {
          font-family: "NotoSansMono Nerd Font";
        }
      '';
      settings = {
        topbar = {
          layer = "top";
          position = "top";
          height = 0;
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = ["hyprland/window"];
          modules-right = [
            "tray"
            #"custom/notification"
            "battery"
            "pulseaudio"
          ];

          reload_style_on_change = true;
          "hyprland/window" = {
            format = "{}";
          };

          tray = {
            icon-size = 16;
            show-passive-items = true;
            spacing = 10;
          };
    battery = {
        states = {
            good = 95;
            warning = 30;
            critical = 20;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰂅"];
    };
          pulseaudio = {
            format = " {volume}%";
            format-muted = " Muted";
            on-click = "pamixer -t";
            on-scroll-up = "pamixer -i 5";
            on-scroll-down = "pamixer -d 5";
            scroll-step = 5;
            tooltip = true;
          };
        };
      };
    };
  };
};
}
