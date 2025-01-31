{inputs, ...}:
with lib; let
  cfg = config.features.desktop.fonts;
in {
  options.dotfiles.nvim.enable = mkEnableOption "Additional fonts";
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
