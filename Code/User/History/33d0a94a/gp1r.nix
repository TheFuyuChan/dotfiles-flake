{inputs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  home.file.".config/nvim" = {
    source = "${inputs.dotfiles}/nvim";
    recursive = true;
  };
}
