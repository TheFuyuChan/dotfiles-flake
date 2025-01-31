{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {vscode.enable = lib.mkEnableOption "Enables vscodium";};
  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        jnoortheen.nix-ide
        kamadorueda.alejandra
        formulahendry.auto-close-tag
        adpyke.codesnap
        esbenp.prettier-vscode
        eamodio.gitlens
        alefragnani.project-manager
        pkief.material-icon-theme
        batisteo.vscode-django
        oderwat.indent-rainbow
        aaron-bond.better-comments
        gruntfuggly.todo-tree
        adpyke.codesnap
        asvetliakov.vscode-neovim
        jnoortheen.nix-ide
        ritwickdey.liveserver
      ];

      userSettings = {
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font Mono'";
        "workbench.iconTheme" = "material-icon-theme";
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };
        "scss-to-css-compile.autoPrefixer" = true;
        "[scss]" = {
          "editor.defaultFormatter" = "sibiraj-s.vscode-scss-formatter";
        };

        "projectManager.git.baseFolders" = ["~/Projects"];
        "html.format.enable" = false;
        "editor.fontFamily" = "'JetBrainsMono Nerd Font Mono'";
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "liveServer.settings.donotShowInfoMsg" = true;
        "explorer.autoReveal" = false;
        "git.decorations.enabled" = false;
        "git.enableSmartCommit" = true;
        "codesnap.shutterAction" = "copy";
        "workbench.colorTheme" = "Stylix";
        "files.associations" = {
          "*.html" = "html";
        };
      };
    };
  };
}
