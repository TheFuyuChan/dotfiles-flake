{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./waybar.nix
    ./hyprland/hyprland.nix
    ./fonts.nix
  ];

  programs = {
  };

  home.packages = with pkgs; [
  ];
}
