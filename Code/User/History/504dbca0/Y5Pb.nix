{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.fonts;
in {
  options.features.desktop.fonts.enable = mkEnableOption "Additional fonts";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fira-code
      fira-code-symbols
      fira-code-nerdfont
      font-manager
      font-awesome_5
      noto-fonts
    ];
  };
}
