{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.fonts;
in {}
