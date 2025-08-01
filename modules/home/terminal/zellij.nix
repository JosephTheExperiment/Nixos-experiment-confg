{ pkgs-unstable, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    exitShellOnExit = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    default_shell "fish"
    mouse_mode false
    scrollback_editor "${pkgs-unstable.helix}/bin/hx"
    show_startup_tips false
    on_force_close "quit"
    copy_on_select false

    keybinds clear-defaults=true {
        normal {}
        locked {
            bind "Shift Alt g" { SwitchToMode "Normal" ; }
        }
        resize {
            bind "Shift Alt r"     { SwitchToMode "Normal" ; }
            bind "h" "Left"  { Resize "Increase Left" ; }
            bind "j" "Down"  { Resize "Increase Down" ; }
            bind "k" "Up"    { Resize "Increase Up" ; }
            bind "l" "Right" { Resize "Increase Right" ; }
        }
        pane {
            bind "Shift Alt p"     { SwitchToMode "Normal" ; }
            bind "c"         { Clear ; }
            bind "e"         { TogglePaneEmbedOrFloating ; SwitchToMode "Normal" ; }
            bind "f"         { ToggleFocusFullscreen ; SwitchToMode "Normal" ; }
            bind "j" "Down"  { NewPane "Down" ; SwitchToMode "Normal" ; }
            bind "l" "Right" { NewPane "Right" ; SwitchToMode "Normal" ; }
            bind "n"         { NewPane ; SwitchToMode "Normal" ; }
            bind "p"         { SwitchFocus ; SwitchToMode "Normal" ; }
            bind "r"         { SwitchToMode "RenamePane" ; PaneNameInput 0 ; }
            bind "w"         { ToggleFloatingPanes ; SwitchToMode "Normal" ; }
            bind "x"         { CloseFocus ; SwitchToMode "Normal" ; }
            bind "z"         { TogglePaneFrames ; SwitchToMode "Normal" ; }
        }
        move {
            bind "Shift Alt m"     { SwitchToMode "Normal"; }
            bind "h" "Left"  { MovePane "Left" ; }
            bind "j" "Down"  { MovePane "Down" ; }
            bind "k" "Up"    { MovePane "Up" ; }
            bind "l" "Right" { MovePane "Right" ; }
        }
        tab {
            bind "Shift Alt t" { SwitchToMode "Normal" ; }
            bind "b"     { BreakPane; SwitchToMode "Normal" ; }
            bind "h"     { MoveTab "Left" ; }
            bind "l"     { MoveTab "Right" ; }
            bind "n"     { NewTab ; SwitchToMode "Normal" ; }
            bind "r"     { SwitchToMode "RenameTab" ; TabNameInput 0 ; }
            bind "x"     { CloseTab ; SwitchToMode "Normal" ; }
            bind "1"     { GoToTab 1 ; SwitchToMode "Normal" ; }
            bind "2"     { GoToTab 2 ; SwitchToMode "Normal" ; }
            bind "3"     { GoToTab 3 ; SwitchToMode "Normal" ; }
            bind "4"     { GoToTab 4 ; SwitchToMode "Normal" ; }
            bind "5"     { GoToTab 5 ; SwitchToMode "Normal" ; }
            bind "6"     { GoToTab 6 ; SwitchToMode "Normal" ; }
            bind "7"     { GoToTab 7 ; SwitchToMode "Normal" ; }
            bind "8"     { GoToTab 8 ; SwitchToMode "Normal" ; }
            bind "9"     { GoToTab 9 ; SwitchToMode "Normal" ; }
        }
        scroll {
            bind "Shift Alt s"    { SwitchToMode "Normal" ; }
            bind "d"        { HalfPageScrollDown ; }
            bind "u"        { HalfPageScrollUp ; }
            bind "j" "Down" { ScrollDown ; }
            bind "k" "Up"   { ScrollUp ; }
            bind "Home"     { ScrollToTop ; SwitchToMode "Normal" ; }
            bind "End"      { ScrollToBottom ; SwitchToMode "Normal" ; }
            bind "PageDown" { PageScrollDown ; }
            bind "PageUp"   { PageScrollUp ; }
            bind "s"        { SwitchToMode "EnterSearch" ; SearchInput 0 ; }
        }
        search {
            bind "Shift Alt s" { SwitchToMode "Normal" ; }
            bind "n"     { Search "down" ; }
            bind "p"     { Search "up" ; }
            bind "c"     { SearchToggleOption "CaseSensitivity" ; }
            bind "w"     { SearchToggleOption "Wrap" ; }
            bind "o"     { SearchToggleOption "WholeWord" ; }
        }
        entersearch {
            bind "Shift Alt c" "Esc" { SwitchToMode "Scroll" ; }
            bind "Enter"       { SwitchToMode "Search" ; }
        }
        renametab {
            bind "Shift Alt c" { SwitchToMode "Normal" ; }
            bind "Esc"   { UndoRenameTab ; SwitchToMode "Tab" ; }
        }
        renamepane {
            bind "Shift Alt c" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
        }
        session {
            bind "Shift Alt o" { SwitchToMode "Normal" ; }
            bind "d"     { Detach ; }
            bind "w"     {
                LaunchOrFocusPlugin "session-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "Normal"
            }
        }
        shared_except "locked" {
            bind "Shift Alt g"             { SwitchToMode "Locked" ; }
            bind "Shift Alt q"             { Quit ; }
            bind "Shift Alt h" "Shift Alt Left"  { MoveFocusOrTab "Left" ; }
            bind "Shift Alt l" "Shift Alt Right" { MoveFocusOrTab "Right" ; }
            bind "Shift Alt j" "Shift Alt Down"  { MoveFocus "Down" ; }
            bind "Shift Alt k" "Shift Alt Up"    { MoveFocus "Up" ; }
            bind "Shift Alt ["             { PreviousSwapLayout ; }
            bind "Shift Alt ]"             { NextSwapLayout ; }
        }
        shared_except "normal" "locked" {
            bind "Enter" "Esc" { SwitchToMode "Normal" ; }
        }
        shared_except "pane" "locked" {
            bind "Shift Alt p" { SwitchToMode "Pane" ; }
        }
        shared_except "resize" "locked" {
            bind "Shift Alt r" { SwitchToMode "Resize" ; }
        }
        shared_except "scroll" "locked" {
            bind "Shift Alt s" { SwitchToMode "Scroll" ; }
        }
        shared_except "session" "locked" {
            bind "Shift Alt o" { SwitchToMode "Session" ; }
        }
        shared_except "tab" "locked" {
            bind "Shift Alt t" { SwitchToMode "Tab" ; }
        }
        shared_except "move" "locked" {
            bind "Shift Alt m" { SwitchToMode "Move" ; }
        }
    }
'';
}
