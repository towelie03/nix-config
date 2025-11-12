{
    workspace = [
      "1, monitor:DP-4"
      "2, monitor:DP-4"
      "3, monitor:DP-4"
      "4, monitor:DP-4"
      "5, monitor:DP-4"

      "6, monitor:DP-5"
      "7, monitor:DP-5"
      "8, monitor:DP-5"
      "9, monitor:DP-5"
      "10, monitor:DP-5"
    ];

    windowrule = [
      "workspace 9 silent, class:^(steam)$"
      "workspace 7 silent, class:^(feishin)$"
      "workspace 6 silent, class:^(discord)$"
      "workspace 10 silent, class:^(keepassxc)$"
      "workspace 9, class:^(mpv)$"

      "float, class:^(nautilis)$"
      "size 875 550, class:^(nautilis)$"
      "float, class:^(mpv)$"

      # opacity rules
      # "opacity 0.6 0.6, class:^(Alacritty)$"
      "opacity 0.8 0.7, class:^(kitty)$"
      "opacity 0.80 0.80, class:^(feishin)$"
      "opacity 0.80 0.80, class:^(discord)$"
      "opacity 0.8 0.8, class:^(obsidian)$"
      "opacity 0.9 0.9, class:^(brave-browser)$"
    ];
}



