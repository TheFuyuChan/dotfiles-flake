{
  pkgs,
  lib,
  inputs,
  ...
}: {
  config = {
    wayland.windowManager.hyprland = {
      settings = {
        "$mod" = "SUPER";
        bindm = [
          # Move/resize windows with Super + LMB/RMB and dragging
          "Super, mouse:272, movewindow"
          "Super, mouse:273, resizewindow"
        ];

        bindl = [
          #",Print,exec,grim - | wl-copy"
          "Super ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
          "Alt ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          "Super+Shift,M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          # "Print,exec,grim - | wl-copy"
          # Media
          "Control, XF86AudioNext, exec, playerctl next || playerctl position `bc <<< '100 * $(playerctl metadata mpris:length) / 1000000 / 100'`"
          ", XF86AudioPrev, exec, playerctl previous"
          ",XF86AudioPlay, exec, playerctl play-pause"
        ];
        bind = [
          # ################################### Applications ###################################
          # Apps: just normal apps
          "Super, C, exec, vscodium --password-store=gnome --enable-features=UseOzonePlatform --ozone-platform=wayland"
          #TODO variables
          "Super+Shift, F, exec, thunar"
          "Super, B, exec, io.github.zen_browser.zen"
          "Super, RETURN, exec, ghostty #Terminal"
          "Super, E, exec, emacsclient -c"

          # Apps: Settings and config
          "Control+Super, V, exec, pavucontrol"

          # Actions
          "Super+SHIFT, C, killactive,"
          "Super, Space, togglefloating,"
          "Shift+Super+Alt, Q, exec, hyprctl kill"
          "Super Control, Q, exec, pkill wlogout || wlogout -p layer-shell"
          "Control+Shift+Alt+Super, Delete, exec, systemctl poweroff || loginctl poweroff"
          # Screenshot, Record, OCR, Color picker, Clipboard history
          "Super+Shift, S, exec, hyprshot -m region --clipboard-only"
          "Super, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          #"Super+Alt, R, exec, ~/.config/hypr/scripts/record-script.sh"
          #"Control+Alt, R, exec, ~/.config/hypr/scripts/record-script.sh --fullscreen"
          #"Super+Shift+Alt, R, exec, ~/.config/hypr/scripts/record-script.sh --fullscreen-sound"

          # Image-To-Text
          # Normal
          #"Control+Super+Shift,S,exec,grim -g '$(slurp $SLURP_ARGS)' 'tmp.png' && tesseract 'tmp.png' - | wl-copy && rm 'tmp.png'"
          # English
          #"Super+Shift,T,exec,grim -g '$(slurp $SLURP_ARGS)' 'tmp.png' && tesseract -l eng 'tmp.png' - | wl-copy && rm 'tmp.png'"
          # Japanese
          #"Super+Shift,N,exec,grim -g '$(slurp $SLURP_ARGS)' 'tmp.png' && tesseract -l jpn 'tmp.png' - | wl-copy && rm 'tmp.png'"

          # App launcher
          "Super, R, exec, rofi -show drun"

          # ########################### Keybinds for Hyprland ############################
          # Swap windows
          "Super+SHIFT, H, movewindow, l"
          "Super+SHIFT, L, movewindow, r"
          "Super+SHIFT, K, movewindow, u"
          "Super+SHIFT, J, movewindow, d"
          "Super, P, pin"
          # Move focus
          "Super, h, movefocus, l"
          "Super, l, movefocus, r"
          "Super, k, movefocus, u"
          "Super, j, movefocus, d"

          # Window split ratio
          "Super+CTRL, H, splitratio, -0.1"
          "Super+CTRL, L, splitratio, 0.1"
          "Super+CTRL, K, splitratio, -0.1"
          "Super+CTRL, J, splitratio, 0.1"

          # Fullscreen
          "Super, F, fullscreen, 0"
          "Super, D, fullscreen, 1"

          # Switching
          "Super, 1, workspace, 1"
          "Super, 2, workspace, 2"
          "Super, 3, workspace, 3"
          "Super, 4, workspace, 4"
          "Super, 5, workspace, 5"
          "Super, 6, workspace, 6"
          "Super, 7, workspace, 7"
          "Super, 8, workspace, 8"
          "Super, 9, workspace, 9"
          "Super, 0, workspace, 10"
          "Super, S, togglespecialworkspace,"
          "Control+Super, S, togglespecialworkspace,"
          "Alt, Tab, cyclenext"
          "Alt, Tab, bringactivetotop,   # bring it to the top"

          # Move window to workspace Super + shift + [0-9]
          "Super+Shift, 1, movetoworkspacesilent, 1"
          "Super+Shift, 2, movetoworkspacesilent, 2"
          "Super+Shift, 3, movetoworkspacesilent, 3"
          "Super+Shift, 4, movetoworkspacesilent, 4"
          "Super+Shift, 5, movetoworkspacesilent, 5"
          "Super+Shift, 6, movetoworkspacesilent, 6"
          "Super+Shift, 7, movetoworkspacesilent, 7"
          "Super+Shift, 8, movetoworkspacesilent, 8"
          "Super+Shift, 9, movetoworkspacesilent, 9"
          "Super+Shift, 0, movetoworkspacesilent, 10"
          "Control+Shift+Super, Up, movetoworkspacesilent, special"
          "Super+Alt, S, movetoworkspacesilent, special"
        ];
        bindle = [
          # Volume
          ", XF86AudioRaiseVolume, exec, wpctl set-volume  @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume  @DEFAULT_AUDIO_SINK@ 5%-"
        ];
      };
    };
  };
}
