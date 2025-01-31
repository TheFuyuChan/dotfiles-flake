
{
pkgs,
lib,
config,
  ...
}: {
  config = {
    wayland.windowManager.hyprland = {
      settings = {
    general = with config.colorScheme.colors; {
          "col.active_border" = lib.mkForce "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
          "col.inactive_border" = lib.mkForce "rgba(${base00}ff)";
          
        };      

        # "plugins:borders-plus-plus" = {
        #   add_borders = 1;
        #
        #   "col.border_1" = "rgb(ffffff)";
        #   "col.border_2" = "rgb(2222ff)";
        #
        #   "border_size_1" = 10;
        #   "border_size_2" = -1;
        #
        #   "natural_rounding" = "yes";
        # };
  };
    };
  };
}
