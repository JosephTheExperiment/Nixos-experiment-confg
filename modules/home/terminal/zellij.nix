{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
        default_shell "fish"
        scrollback_editor "${pkgs.evil-helix}/bin/hx"
        show_startup_tips false

        // If you'd like to override the default keybindings completely, be sure to change "keybinds" to "keybinds clear-defaults=true"
    keybinds clear-defaults=true {
        tmux {
            bind "[" { SwitchToMode "Scroll"; }

            // Leave tmux mode
            bind "Ctrl b" { Write 2; SwitchToMode "Normal"; }

            bind "z" { ToggleFocusFullscreen; SwitchToMode "Normal"; }

            // Tab creation
            bind "c" { NewTab; SwitchToMode "Normal"; }
            bind "t" { NewTab; SwitchToMode "Normal"; }

            // Session manager
            bind "s" "$" ":" {
                LaunchOrFocusPlugin "session-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "Normal"
            }

            // Splitting panes
            bind "|" { NewPane "Right"; SwitchToMode "Normal"; }
            bind "-" { NewPane "Down"; SwitchToMode "Normal"; }

            // Moving between tabs
            bind "p" { GoToPreviousTab; SwitchToMode "Normal"; }
            bind "n" { GoToNextTab; SwitchToMode "Normal"; }
            // Renaming tabs
            bind "," { SwitchToMode "RenameTab"; TabNameInput 0; }

            // Moving between panes
            bind "Left" { MoveFocus "Left"; SwitchToMode "Normal"; }
            bind "Right" { MoveFocus "Right"; SwitchToMode "Normal"; }
            bind "Down" { MoveFocus "Down"; SwitchToMode "Normal"; }
            bind "Up" { MoveFocus "Up"; SwitchToMode "Normal"; }
            bind "h" { MoveFocus "Left"; SwitchToMode "Normal"; }
            bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }
            bind "j" { MoveFocus "Down"; SwitchToMode "Normal"; }
            bind "k" { MoveFocus "Up"; SwitchToMode "Normal"; }
            // Renaming panes
            bind "." { SwitchToMode "RenamePane"; PaneNameInput 0; }
            // Resizing panes
            bind "H" { Resize "Increase Left"; }
            bind "L" { Resize "Increase Right"; }
            bind "K" { Resize "Increase Up"; }
            bind "J" { Resize "Increase Down"; }

            // bind "o" { FocusNextPane; }

            bind "d" { Detach; }

            bind "Space" { NextSwapLayout; }

            bind "x" { CloseFocus; SwitchToMode "Normal"; }
        }
        scroll {
            //bind "e" { EditScrollback; SwitchToMode "Normal"; }
            //bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
            //bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
            bind "Ctrl r" { SwitchToMode "EnterSearch"; SearchInput 0; }

            // Navigation
            bind "j" "Down" { ScrollDown; }
            bind "PageDown" "J" { PageScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "PageUp" "K" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }

            bind "Esc" { SwitchToMode "Normal"; }
            //bind "Ctrl s" { SwitchToMode "Normal"; }

            // uncomment this and adjust key if using copy_on_select=false
            // bind "Alt c" { Copy; }
        }
        entersearch {
            bind "Esc" { ScrollToBottom; SwitchToMode "Scroll"; }
            bind "Enter" { SwitchToMode "Search"; }
        }
        search {
            //bind "Ctrl s" { SwitchToMode "Normal"; }
            //bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
            bind "Esc" { ScrollToBottom; SwitchToMode "Scroll"; }

            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
            bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }

            bind "n" { Search "down"; }
            bind "p" { Search "up"; }

            bind "c" { SearchToggleOption "CaseSensitivity"; }
            bind "w" { SearchToggleOption "Wrap"; }
            bind "o" { SearchToggleOption "WholeWord"; }
        }
        session {
            bind "Ctrl o" { SwitchToMode "Normal"; }
        }
        renametab {
            bind "Ctrl b" { SwitchToMode "Normal"; }
            bind "Enter" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenameTab; SwitchToMode "Normal"; }
        }
        renamepane {
            bind "Enter" { SwitchToMode "Normal"; }
            bind "Ctrl c" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
        }
        shared_except "tmux" "locked" {
            // Enter tmux mode
            bind "Ctrl b" { SwitchToMode "Tmux"; }
        }
    }

     on_force_close "quit"

     auto_layout true

     default_mode "locked"

     mouse_mode false

     scroll_buffer_size 10000

     copy_clipboard "primary"
     copy_on_select false
  '';
}
