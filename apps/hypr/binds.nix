{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind =
      [
        "ALT, Space, exec, dms ipc call spotlight toggle"
        "SUPER, V, exec, dms ipc call clipboard toggle"
        "SUPER, M, exec, dms ipc call processlist toggle"
        "SUPER, N, exec, dms ipc call notifications toggle"
        "SUPER, comma, exec, dms ipc call settings toggle"
        "SUPER, P, exec, dms ipc call notepad toggle"
        "SUPERALT, L, exec, dms ipc call lock lock"
        "SUPER, X, exec, dms ipc call powermenu toggle"
        "SUPER, C, exec, dms ipc call control-center toggle"

        # Night mode toggle
        "SUPER SHIFT, N, exec, dms ipc call night toggle"

        # Screenshots
        "SUPER, PRINT, exec, hyprshot -m output"
        "SUPER_SHIFT, PRINT, exec, hyprshot -m region --clipboard-only"

        # Hyprland Core
        "SUPER, Q, killactive"
        "SUPER, F, fullscreen"
        "SUPER, T, togglefloating"
        "SUPER, J, togglesplit"

        # Terminals
        "CTRL, RETURN, exec, alacritty"
        "CTRL_SHIFT, RETURN, exec, kitty"
        "CTRL_SHIFT, ESCAPE, exec, alacritty -e btop"

        # Browser
        "SUPER, B, exec, brave --disable-features=WaylandWpColorManagerV1"

        # Focus Movement
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Scroll workspaces
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        # Resize Active Window
        "SUPERCTRL, left, resizeactive, -20 0"
        "SUPERCTRL, right, resizeactive, 20 0"
        "SUPERCTRL, up, resizeactive, 0 -20"
        "SUPERCTRL, down, resizeactive, 0 20"

        # Split Ratio
        "SUPERCTRL, Minus, splitratio, -0.1"
        "SUPERCTRL, Equal, splitratio, 0.1"
      ]
      ++ (
        # Workspaces 1–10: switch + move to
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mainMod, ${toString ws}, workspace, ${toString ws}"
            "$mainMod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"
          ]
        ) 10)
      );

    bindle = [
      ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
      ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
    ];

    bindl = [
      ", XF86AudioMute, exec, dms ipc call audio mute"
      ", XF86AudioMicMute, exec, dms ipc call audio micmute"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 \"\""
      ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 \"\""
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}

