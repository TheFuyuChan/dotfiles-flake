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
}
