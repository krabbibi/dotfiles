{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ ./home.nix ];
  home = {
    username = "krabbe";
    homeDirectory = "/Users/krabbe";
    packages = with pkgs; [
      mkalias
      python3
      zstd
      jankyborders
      sketchybar-app-font
    ];
  };
  programs = {
    aerospace = {
      enable = true;
      userSettings = {
        gaps = {
        inner.horizontal = 12;
        inner.vertical = 12;
        outer.bottom = 10;
        outer.top = 10;
        outer.right = 12;
        outer.left = 12;
          };
        default-root-container-layout = "tiles";
        after-startup-command = [
          "exec-and-forget borders active_color=0xb4befee4 inactive_color=0x585b7064 width=3.0"
        ];
        exec-on-workspace-change = ["/bin/bash" "-c" "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"];
        mode.main.binding = {
          alt-b = "exec-and-forget open -a ~/Applications/Home\ Manager\ Apps/Brave\ Browser.app";
          alt-enter = "exec-and-forget open -a /Applications/Ghostty.app";
          alt-o = "exec-and-forget open -a ~/Applications/Home\ Manager\ Apps/Obsidian.app";
          alt-shift-r = ["exec-and-forget /opt/homebrew/bin/sketchybar --reload"];

# See: https://nikitabobko.github.ioeAeroSpace/commands#layout
          alt-e = "layout tiles horizontal vertical";
          alt-comma = "layout accordion horizontal vertical";
          alt-f = "fullscreen";
          alt-y = ["focus right" 
            "join-with down" 
            "layout tiles horizontal"];
# See: https://nikitabobko.github.io/AeroSpace/commands#focus
          alt-h = "focus left";
          alt-j = "focus down";
          alt-k = "focus up";
          alt-l = "focus right";

# app shortcut

# See: https://nikitabobko.github.io/AeroSpace/commands#move
          alt-shift-h = "move left";
          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";

# See: https://nikitabobko.github.io/AeroSpace/commands#resize
          alt-shift-minus = "resize smart -50";
          alt-shift-equal = "resize smart +50";

# See: https://nikitabobko.github.io/AeroSpace/commands#workspace;
          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";
          alt-7 = "workspace 7";

# See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace;
          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";
          alt-shift-6 = "move-node-to-workspace 6";
          alt-shift-7 = "move-node-to-workspace 7";

# See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth;
          alt-tab = "workspace-back-and-forth";
# See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

# See: https://nikitabobko.github.io/AeroSpace/commands#mode
          alt-shift-semicolon = "mode service";

# "service" binding mode declaration.
# See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
        };
        on-window-detected = [
          {
            "if".app-id = "md.Obsidian";
            run = "move-node-to-workspace 5";
          }
          {
            "if".app-id = "com.brave.Browser";
            run = "move-node-to-workspace 1";
          }
        ];
      };
    };
    sketchybar = {
      enable = true;
    };
  };
}
