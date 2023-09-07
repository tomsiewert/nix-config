{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.kitty = {
      enable = true;

      settings = {
        enable_audio_bell = false;
        term = "xterm";
        allow_remote_control = true;
        bell_on_tab = false;
        scrollback_lines = 20000;
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        tab_title_template = "{index}:{title}";
        tab_bar_min_tabs = 1;
        tab_bar_background = "#333333";
      };

      font = {
        name = "dejavysansmono";
        size = 11.0;
      };

      keybindings = {
        "shift+page_up" = "scroll_page_up";
        "shift+page_down" = "scroll_page_down";
        "shift+right" = "next_tab";
        "shift+left" = "previous_tab";
        "ctrl+alt+c" = "copy_to_clipboard";
        "ctrl+alt+v" = "paste_from_clipboard";
      };
    };
  };
}
