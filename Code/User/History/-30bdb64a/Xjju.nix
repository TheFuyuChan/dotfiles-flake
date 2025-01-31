{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.features.desktop.wayland;
in {
  options.features.desktop.wayland.enable = mkEnableOption "extra wayland configs";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
      hyprlock
      qt6.qtwayland
      # Unsure
      waypipe
      wf-recorder
      wl-mirror
      wl-clipboard
      wlogout
      wtype
      ydotool
      wlprop
      jq

      #hyprland
      waybar
      dunst
      libnotify
      swww
      rofi-wayland
    ];
  };
}
