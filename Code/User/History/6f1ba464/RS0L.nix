{
  pkgs,
  lib,
  inputs,
  ...
}: {
  config = {
    wayland.windowManager.hyprland = {
      settings = {
        exec-once = [
          "waybar"
          "swww-daemon"
          "keepassxc"
          #"systemctl --user start hyprpolkitagent"
        ];
      };
    };
  };
}
