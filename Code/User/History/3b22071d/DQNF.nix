{pkgs, ...}: {

imports = [
    ./wayland.nix
    ./waybar.nix
    ./hyprland.nix
];

programs = {

    };

    home.packages = with pkgs; [

    ];
}
