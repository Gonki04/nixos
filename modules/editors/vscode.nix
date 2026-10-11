{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode; # or vscodium

    profiles.default = {
      # Let Nix handle updates
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      userSettings = {
        "workbench.colorTheme" = "Default Dark Modern";
        "workbench.colorCustomizations" = {
          "focusBorder" = "#777777";
          "foreground" = "#E0E0E0";
          "descriptionForeground" = "#888888";
          "textLink.foreground" = "#FFFFFF";
          "errorForeground" = "#FFFFFF";
          "activityBar.background" = "#101010";
          "activityBar.foreground" = "#EEEEEE";
          "activityBar.inactiveForeground" = "#777777";
          "sideBar.background" = "#101010";
          "sideBar.foreground" = "#CCCCCC";
          "sideBar.border" = "#303030";
          "titleBar.activeBackground" = "#080808";
          "titleBar.activeForeground" = "#EEEEEE";
          "statusBar.background" = "#202020";
          "statusBar.foreground" = "#EEEEEE";
          "editor.background" = "#080808";
          "editor.foreground" = "#E0E0E0";
          "editorCursor.foreground" = "#FFFFFF";
          "editorLineNumber.foreground" = "#666666";
          "editorLineNumber.activeForeground" = "#FFFFFF";
          "editor.lineHighlightBackground" = "#151515";
          "editor.selectionBackground" = "#383838";
          "editor.inactiveSelectionBackground" = "#252525";
          "editorIndentGuide.background1" = "#282828";
          "editorIndentGuide.activeBackground1" = "#555555";
          "editorWidget.background" = "#141414";
          "editorWidget.border" = "#383838";
          "editorGroupHeader.tabsBackground" = "#101010";
          "tab.activeBackground" = "#181818";
          "tab.activeForeground" = "#FFFFFF";
          "tab.inactiveBackground" = "#101010";
          "tab.inactiveForeground" = "#777777";
          "panel.background" = "#080808";
          "panel.border" = "#303030";
          "terminal.background" = "#080808";
          "terminal.foreground" = "#E0E0E0";
          "terminalCursor.foreground" = "#FFFFFF";
          "terminal.selectionBackground" = "#383838";
          "terminal.ansiBlack" = "#080808";
          "terminal.ansiRed" = "#888888";
          "terminal.ansiGreen" = "#A0A0A0";
          "terminal.ansiYellow" = "#B8B8B8";
          "terminal.ansiBlue" = "#707070";
          "terminal.ansiMagenta" = "#999999";
          "terminal.ansiCyan" = "#C0C0C0";
          "terminal.ansiWhite" = "#E0E0E0";
          "terminal.ansiBrightBlack" = "#505050";
          "terminal.ansiBrightRed" = "#AAAAAA";
          "terminal.ansiBrightGreen" = "#B8B8B8";
          "terminal.ansiBrightYellow" = "#FFFFFF";
          "terminal.ansiBrightBlue" = "#909090";
          "terminal.ansiBrightMagenta" = "#D0D0D0";
          "terminal.ansiBrightCyan" = "#E0E0E0";
          "terminal.ansiBrightWhite" = "#FFFFFF";
        };
        "editor.tokenColorCustomizations" = {
          "textMateRules" = [
            {
              "scope" = [ "comment" "punctuation.definition.comment" ];
              "settings" = { "foreground" = "#777777"; "fontStyle" = "italic"; };
            }
            {
              "scope" = [ "string" "punctuation.definition.string" ];
              "settings" = { "foreground" = "#C8C8C8"; };
            }
            {
              "scope" = [ "keyword" "storage" "constant.language" ];
              "settings" = { "foreground" = "#FFFFFF"; "fontStyle" = "bold"; };
            }
            {
              "scope" = [ "entity.name.function" "support.function" ];
              "settings" = { "foreground" = "#E0E0E0"; };
            }
            {
              "scope" = [ "entity.name.type" "entity.name.class" "support.type" ];
              "settings" = { "foreground" = "#B8B8B8"; };
            }
            {
              "scope" = [ "constant.numeric" "constant.character" "variable" ];
              "settings" = { "foreground" = "#D0D0D0"; };
            }
            {
              "scope" = [ "punctuation" "keyword.operator" ];
              "settings" = { "foreground" = "#888888"; };
            }
          ];
        };
        "editor.semanticTokenColorCustomizations" = {
          "enabled" = true;
          "rules" = {
            "variable" = "#E0E0E0";
            "parameter" = "#B8B8B8";
            "function" = "#D0D0D0";
            "method" = "#D0D0D0";
            "class" = "#C0C0C0";
            "type" = "#B8B8B8";
            "property" = "#CCCCCC";
            "keyword" = "#FFFFFF";
          };
        };

        # Disable Telemetry and Data Collection
        "telemetry.telemetryLevel" = "off";
        "workbench.enableExperiments" = false;
        "update.showReleaseNotes" = false;

        "editor.inlineSuggest.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "editor.minimap.enabled" = false;
        "breadcrumbs.enabled" = false;
        "workbench.startupEditor" = "none";
        "workbench.tips.enabled" = false;
        "workbench.tree.indent" = 12;

        # Extension specific:
        "[python]" = { "editor.formatOnSave" = false; };
        "vim.useSystemClipboard" = true;
        "vim.handleKeys" = {
          "<C-c>" = false;
          "<C-v>" = false;
          "<C-x>" = false;
        };
      };

      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        ms-python.python
      ];
    };
  };
}
