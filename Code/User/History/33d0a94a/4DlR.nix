{inputs, ...}:
with lib; let
  cfg = config.dotfiles.nvim;
in {
  options.dotfiles.nvim.enable = mkEnableOption "enables and configures nvim";
  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
    home.file.".config/nvim" = {
      source = "${inputs.dotfiles}/nvim";
      recursive = true;
    };
  };
}
