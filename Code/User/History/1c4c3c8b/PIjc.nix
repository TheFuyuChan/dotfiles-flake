{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {
  imports = mkIf cfg.enable [
    ./autostart.nix
    ./keybinds.nix
    ./theme.nix
  ];
  options.features.desktop.hyprland.enable = mkEnableOption "enables hyprland";
  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      # nvidiaPatches = true;
      xwayland.enable = true;
    };
    home.packages = with pkgs; [
      playerctl
      hyprshot
      waybar
      dunst
      libnotify
      swww
      rofi-wayland
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.variables = ["--all"];
      systemd.enable = false;
      plugins = [
        # inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
      ];

      settings = {
        "$mod" = "SUPER";

        workspace = [
          "1, defaultName:main"
          "2, defaultName:browser"
          "3, defaultName:media"
          "4, defaultName:Code"
          "special:special, on-created-empty:[float] discord"
        ];
        windowrule = [
          "float, class:Scratchpad"
          "opacity 0.7, class:^(Scratchpad)$"
          "opacity 0.7, class:^(Emacs)$"
          "float, Lxappearance"
          "float, Rofi"
          "animation none,Rofi"
          "float,viewnior"
          "float,feh"
          "idleinhibit focus, mpv"
          "idleinhibit fullscreen, floorp"
        ];
        layerrule = [
          "xray 1, .*"
          "noanim, .*"
          "noanim, walker"
          "noanim, selection"
          "noanim, overview"
          "noanim, anyrun"
          "noanim, indicator.*"
          "noanim, osk"
          "noanim, hyprpicker"
          "blur, shell:*"
          "ignorealpha 0.6, shell:*"
          "noanim, noanim"
          "blur, gtk-layer-shell"
          "ignorezero, gtk-layer-shell"
          "blur, launcher"
          "ignorealpha 0.5, launcher"
          "blur, notifications"
          "ignorealpha 0.69, notifications"
        ];

        input = {
          kb_layout = "se";
          numlock_by_default = "true";
          repeat_delay = "250";
          repeat_rate = "35";

          kb_options = "caps:swapescape";
          special_fallthrough = "true";
          follow_mouse = "1";
        };
        monitor = [
          "eDP-1,1920x1080@120.03,auto,1"
          "monitor= HDMI-A-1, 2560x1440@60,auto,1"
        ];
      };
    };
  };
}
