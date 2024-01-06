{config, pkgs, inputs, vars, ...}:

let
  mod = config.xsession.windowManager.i3.config.modifier;
in
{
  home = {
    packages = with pkgs; [
      brightnessctl playerctl
      libva libsForQt5.qt5ct
      feh scrot
    ];
  };
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      gaps = {
        inner = 8;
        outer = 0;
        smartGaps = true;
      };
      fonts = {
        names = [ "DejaVu Sans Mono" ];
        style = "regular";
        size = 11.0;
      };
      colors = {
        focused = {
          background = "#13141B";
          border = "#404159";
          childBorder = "#404159";
          indicator = "#404159";
          text = "#D4DAE8";
        };
        focusedInactive = {
          background = "#090a11";
          border = "#404159";
          childBorder = "#242532";
          indicator = "#242532";
          text = "#AFB4C0";
        };
        unfocused = {
          background = "#090a11";
          border = "#242532";
          childBorder = "#242532";
          indicator = "#242532";
          text = "#AFB4C0";
        };
        urgent = {
          background = "#660A1E";
          border = "#404159";
          childBorder = "#D2143D";
          indicator = "#D2143D";
          text = "#D4DAE8";
        };
        placeholder = {
            background = "#0c0c0c";
            border = "#000000";
            childBorder = "#0c0c0c";
            indicator = "#000000";
            text = "#ffffff";
        };
      };
      window = {
        border = 2;
        hideEdgeBorders = "smart";
        titlebar = false;
        commands = [
          {command = "floating enable"; criteria.title = "xclock";}
          {command = "floating enable"; criteria.title = "Copying";}
          {command = "floating enable"; criteria.title = "Deleting";}
          {command = "floating enable"; criteria.title = "Moving";}
          {command = "floating enable"; criteria.title = "^Terminator Preferences$";}
          {command = "floating enable"; criteria.window_role = "pop-up";}
          {command = "floating enable"; criteria.window_role = "task_dialog";}
          {command = "floating enable"; criteria.window_role = "^Preferences$";}
          {command = "floating enable"; criteria.window_role = "setup";}
          {command = "floating enable"; criteria.window_type = "notification";}
        ];
      };
      startup = [
        {command = "--no-startup-id xrandr --output HDMI-1-0 --auto --right-of eDP"; always = true;}
        {command = "--no-startup-id xset -dpms s off"; always = true;}
        {command = "--no-startup-id feh --no-fehbg --bg-scale ~/wallpapers/darkWhosh.png"; always = true;}
        {command = "--no-startup-id setxkbmap -option ctrl:nocaps us"; always = true;}
        {command = "--no-startup-id xset r rate 300 50"; always = true;}
        {command = "--no-startup-id emacs --daemon"; always = true;}
      ];
      modifier = "Mod4";
      terminal = "kitty";
      focus.followMouse = true;
      focus.mouseWarping = true;
      workspaceAutoBackAndForth = true;
      keybindings = {
        "${mod}+Shift+q" = "kill";
        "${mod}+b" = "bar mode toggle";

        "${mod}+space" = "exec rofi -show drun";
        "${mod}+Return" = "exec kitty";
        "${mod}+Shift+e" = "exec emacsclient --create-frame";

        "mod2+f1" = "exec bash ~/.scripts/kill.sh";

        "mod2+ctrl+shift+q" = "exec xkill";
        "${mod}+ctrl+n" = "exec networkmanager_dmenu";
        "Print" = "exec scrot -s";
        "${mod}+ctrl+s" = "exec setxkbmap -option ctrl:nocaps es";
        "${mod}+ctrl+e" = "exec setxkbmap -option ctrl:nocaps us";

        # audio and brightness
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioStop" = "exec playerctl stop";
        "XF86MonBrightnessUp" = "exec brightnessctl set +10%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";

        # restart i3 inplace
        "${mod}+Shift+r" = "restart";

        # change focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # move focused window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # Moving workspaces between screens 
        "${mod}+p" = "move workspace to output right";

        # split orientation
        "${mod}+c" = "split h";
        "${mod}+v" = "split v";
        "${mod}+q" = "split toggle";

        # toggle fullscreen
        "${mod}+m" = "fullscreen toggle";

        # change container layout 
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # toggle tiling / floating
        "${mod}+f" = "floating toggle";

        # change focus between tiling / floating windows
        "${mod}+Shift+f" = "focus mode_toggle";

        # toggle sticky
        "${mod}+Shift+s" = "sticky toggle";

        # focus the parent container
        "${mod}+a" = "focus parent";

        # move the currently focused window to the scratchpad
        "${mod}+Shift+minus" = "move scratchpad";

        # Show the next scratchpad window or hide the focused scratchpad window.
        # If there are multiple scratchpad windows, this command cycles through them.
        "${mod}+minus" = "scratchpad show";

        #navigate workspaces next / previous
        "${mod}+Ctrl+Right" = "workspace next";
        "${mod}+Ctrl+Left" = "workspace prev";

        # switch to workspace
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        
        # Move focused container to workspace
        "${mod}+Ctrl+1" = "move container to workspace 1";
        "${mod}+Ctrl+2" = "move container to workspace 2";
        "${mod}+Ctrl+3" = "move container to workspace 3";
        "${mod}+Ctrl+4" = "move container to workspace 4";
        "${mod}+Ctrl+5" = "move container to workspace 5";
        "${mod}+Ctrl+6" = "move container to workspace 6";
        "${mod}+Ctrl+7" = "move container to workspace 7";
        "${mod}+Ctrl+8" = "move container to workspace 8";
        "${mod}+Ctrl+9" = "move container to workspace 9";
        
        # Move to workspace with focused container
        "${mod}+Shift+1" = "move container to workspace 1; workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2; workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3; workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4; workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5; workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6; workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7; workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8; workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9; workspace 9";

        "${mod}+r" = "mode resize";
      };
      modes ={
        resize = {
          h = "resize shrink width 5 px or 5 ppt";
          j = "resize grow height 5 px or 5 ppt";
          k = "resize shrink height 5 px or 5 ppt";
          l = "resize grow width 5 px or 5 ppt";
          Return = "mode default";
          Escape = "mode default";
        };
      };
      bars = [
        {
          statusCommand = "i3status";
          
          fonts = {
            names = [ "DejaVu Sans Mono" ];
            style = "regular";
            size = 11.0;
          };

          trayOutput = "eDP";
          trayPadding = 5;
          
          workspaceButtons = true;
          position = "top";

          extraConfig = "height 28";
          
          colors = {
            background = "#090a11";
            statusline = "#D4DAE8";
            separator = "#404159";
            
            focusedWorkspace = {
              background = "#404159";
              border = "#404159";
              text = "#D4DAE8";
            };
            activeWorkspace = {
              background = "#242532";
              border = "#242532";
              text = "#AFB4C0";
            };
            inactiveWorkspace = {
              background = "#090a11";
              border = "#090a11";
              text = "#AFB4C0";
            };
            urgentWorkspace = {
              background = "#990F2D";
              border = "#990F2D";
              text = "#D4DAE8";
            };
          };
        }
      ];
    };
  };
}
