{pkgs, ...}: {

imports = [
    ./wayland.nix
    ./waybar.nix
    ./hyprland/hyprland.nix
];

programs = {

    };

    home.packages = with pkgs; [

    ];
}
