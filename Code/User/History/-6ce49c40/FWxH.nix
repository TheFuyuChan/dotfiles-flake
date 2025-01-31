# This is a default home.nix generated by the follwing hone-manager command
#
# home-manager init ./
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    inputs.nix-colors.homeManagerModules.default
  ];

  programs = {
    plasma = {
      enable = true;
      configFile.kded5rc = {
        "Module-gtkconfig"."autoload" = false;
      };
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = lib.mkDefault "fuyu";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
      bitwarden
      direnv
      devenv
      vscode
      stow
      ghostty
      alacritty
      lxappearance
      steam
  ];

  #Theme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  home.pointerCursor = {
     size = 24;
     package = pkgs.catppuccin-cursors.mochaPeach;
     name = "catppuccin-mocha-peach-cursors";
     gtk.enable = true;
   };
  gtk = {
    enable = true;
    # theme = {

    # };

    cursorTheme = {
      name = "catppuccin-mocha-peach-cursors";
      package = pkgs.catppuccin-cursors.mochaPeach;
    };

    # iconTheme = {

    # };
  };
  
  qt = {
    enable = true;
    platformTheme = "gtk";
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/m3tam3re/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
