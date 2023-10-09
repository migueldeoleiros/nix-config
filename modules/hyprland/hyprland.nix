{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      brightnessctl playerctl
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
      enableNvidiaPatches = true;
      plugins = [
        inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];
      extraConfig = ''
        monitor=eDP-1,1920x1080@60,0x0,1
        monitor=HDMI-A-1,1920x1080@60,1920x0,1
        monitor=,preferred,auto,1,mirror,eDP-1
        
        # Execute at launch
        exec-once = hyprpaper & waybar & dunst
        
        # source = ~/.config/hypr/myColors.conf
        
        env = XCURSOR_SIZE,24
        env = LIBVA_DRIVER_NAME,nvidia
        env = XDG_SESSION_TYPE,wayland
        env = __GLX_VENDOR_LIBRARY_NAME,nvidia
        env = WLR_NO_HARDWARE_CURSORS,1
        
        input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options = ctrl:nocaps
            kb_rules =
        
            follow_mouse = 1
        
            touchpad {
                natural_scroll = no
            }
        
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }
        
        general {
            gaps_in = 3
            gaps_out = 5
            border_size = 1
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)
        
            layout = master
        
            allow_tearing = false
        }
        
        xwayland {
            force_zero_scaling = true
        }
        
        decoration {
            rounding = 10
            
            blur {
                enabled = false
                size = 3
                passes = 1
            }
        
            drop_shadow = false
            shadow_range = 4
            shadow_render_power = 3
            col.shadow = rgba(1a1a1aee)
        }
        
        animations {
            enabled = yes
        
            bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        
            animation = windows, 1, 7, myBezier
            animation = windowsOut, 1, 7, default, popin 80%
            animation = border, 1, 10, default
            animation = borderangle, 1, 8, default
            animation = fade, 1, 7, default
            animation = workspaces, 1, 6, default
        }
        
        dwindle {
            pseudotile = yes
            preserve_split = yes
            no_gaps_when_only = 1
        }
        
        master {
            new_is_master = false
            drop_at_cursor = true
            no_gaps_when_only = 1
        }
        
        gestures {
            workspace_swipe = on
        }
        
        
        # Example windowrule v1
        # windowrule = float, ^(kitty)$
        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        
        
        $mod = SUPER
        
        bind = $mod, Return, exec, st
        bind = $mod, Q, killactive, 
        bind = $mod, Escape, exit, 
        bind = $mod, F, exec, nautilus
        bind = $mod, E, exec, emacs
        bind = $mod, T, togglefloating, 
        bind = $mod, Space, exec, rofi -show drun
        # bind = $mod, P, pseudo, # dwindle
        # bind = $mod, J, togglesplit, # dwindle

        # audio and brightness
        bind=,xf86audioplay,exec,playerctl play-pause
        bind=,xf86audiostop,exec,playerctl stop
        bind=,xf86audioprev,exec,playerctl previous
        bind=,xf86audionext,exec,playerctl next

        bind=,xf86audioraisevolume,exec,wpctl set-volume @DEFAULT_SINK@ 5%+
        bind=,xf86audiolowervolume,exec,wpctl set-volume @DEFAULT_SINK@ 5%-
        bind=,xf86audiomute,exec,wpctl set-mute @DEFAULT_SINK@ toggle

        bind=,xf86monbrightnessup,exec,brightnessctl set +10
        bind=,xf86monbrightnessdown,exec,brightnessctl set 10-

        # window resize
        bind = $mod, R, submap, resize
        
        submap = resize
        binde = , H, resizeactive, -10 0
        binde = , L, resizeactive, 10 0
        binde = , K, resizeactive, 0 -10
        binde = , J, resizeactive, 0 10
        bind = , escape, submap, reset
        submap = reset
        
        # Move focus
        bind = $mod, left, movefocus, l
        bind = $mod, right, movefocus, r
        bind = $mod, up, movefocus, u
        bind = $mod, down, movefocus, d
        
        bind = $mod, H, movefocus, l
        bind = $mod, L, movefocus, r
        bind = $mod, K, movefocus, u
        bind = $mod, J, movefocus, d

        plugin {
            split-monitor-workspaces {
              count = 5
            }
        }

        # Switch to monitor
        bind = $mod, P, split-changemonitor, next

        # Switch workspaces
        bind = $mod, 1, split-workspace, 1
        bind = $mod, 2, split-workspace, 2
        bind = $mod, 3, split-workspace, 3
        bind = $mod, 4, split-workspace, 4
        bind = $mod, 5, split-workspace, 5
        
        # Move active window to a workspace
        bind = $mod SHIFT, 1, split-movetoworkspace, 1
        bind = $mod SHIFT, 2, split-movetoworkspace, 2
        bind = $mod SHIFT, 3, split-movetoworkspace, 3
        bind = $mod SHIFT, 4, split-movetoworkspace, 4
        bind = $mod SHIFT, 5, split-movetoworkspace, 5
        
        # Move/resize windows with mod + LMB/RMB and dragging
        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow
      ''; 
    };
  };
}