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
          "errorForeground" = "#FF5F5F";
          "editorError.foreground" = "#FF5F5F";
          "editorWarning.foreground" = "#F1FA8C";
          "editorInfo.foreground" = "#61A0FF";
          "editorHint.foreground" = "#4DD0E1";
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
          "terminal.background" = "#000000";
          "terminal.foreground" = "#FFFFFF";
          "terminalCursor.foreground" = "#FFFFFF";
          "terminal.selectionBackground" = "#FFFFFF";
          "terminal.selectionForeground" = "#000000";
          "terminal.ansiBlack" = "#000000";
          "terminal.ansiRed" = "#FF5F5F";
          "terminal.ansiGreen" = "#50FA7B";
          "terminal.ansiYellow" = "#F1FA8C";
          "terminal.ansiBlue" = "#61A0FF";
          "terminal.ansiMagenta" = "#D586FF";
          "terminal.ansiCyan" = "#4DD0E1";
          "terminal.ansiWhite" = "#D0D0D0";
          "terminal.ansiBrightBlack" = "#767676";
          "terminal.ansiBrightRed" = "#FF7A7A";
          "terminal.ansiBrightGreen" = "#76FF9A";
          "terminal.ansiBrightYellow" = "#FFFFA5";
          "terminal.ansiBrightBlue" = "#8BB8FF";
          "terminal.ansiBrightMagenta" = "#E0A4FF";
          "terminal.ansiBrightCyan" = "#79E6F3";
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
              "settings" = { "foreground" = "#50FA7B"; };
            }
            {
              "scope" = [ "keyword" "storage" "constant.language" ];
              "settings" = { "foreground" = "#D586FF"; "fontStyle" = "bold"; };
            }
            {
              "scope" = [ "entity.name.function" "support.function" ];
              "settings" = { "foreground" = "#61A0FF"; };
            }
            {
              "scope" = [ "entity.name.type" "entity.name.class" "support.type" ];
              "settings" = { "foreground" = "#F1FA8C"; };
            }
            {
              "scope" = [ "constant.numeric" "constant.character" "variable" ];
              "settings" = { "foreground" = "#4DD0E1"; };
            }
            {
              "scope" = [ "punctuation" "keyword.operator" ];
              "settings" = { "foreground" = "#D0D0D0"; };
            }
          ];
        };
        "editor.semanticTokenColorCustomizations" = {
          "enabled" = true;
          "rules" = {
            "variable" = "#E0E0E0";
            "parameter" = "#4DD0E1";
            "function" = "#61A0FF";
            "method" = "#8BB8FF";
            "class" = "#F1FA8C";
            "type" = "#F1FA8C";
            "property" = "#D0D0D0";
            "keyword" = "#D586FF";
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
