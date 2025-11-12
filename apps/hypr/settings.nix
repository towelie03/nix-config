{
    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;
      numlock_by_default = true;
    };

    general = {
      gaps_in = 5;
      gaps_out = 8;
      border_size = 0;
      layout = "dwindle";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    binds = {
      allow_workspace_cycles = true;
    };

    cursor = {
      inactive_timeout = 5;
      enable_hyprcursor = true;
      no_warps = true;
    };

    decoration = {
      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        new_optimizations = true;
        contrast = 1;
        brightness = 1;
      };

      rounding = 14;

      shadow = {
        enabled = true;
        range = 10;
        render_power = 2;
        color = "rgba(0, 0, 0, 0.25)";
      };
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = false;
      animate_manual_resizes = false;
      animate_mouse_windowdragging = false;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
      enable_swallow = true;
      vfr = true;
      vrr = true;
    };
}

