{config, ...}: {
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
    ./dotfiles
  ];
  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
    desktop = {
      wayland.enable = true;
      waybar.enable = true;
      hyprland.enable = true;
      fonts.enable = true;
    };
  };
  dotfiles = {
    nvim.enable = true;
  };
}
