{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    services.dunst = {
      enable = true; 
      settings = {
        global = {
          follow = "mouse";
          origin = "top-right";
          width = 300;
          height = 300;
          padding = 10;
          horizontal_padding = 10;
          frame_width = 0;
          idle_threshold = 120;
          font = "Source Code Pro 10";
          alignment = "center";
          vertical_alignment = "center";
          show_age_threshold = 60;
          word_wrap = "yes";
          stack_duplicates = true;
          hide_duplicate_count = true;
          corner_radius = 10;
        };
        urgency_low = {
          background = "#000000";
          foreground = "#a8a8a8";
          timeout = 5;
        };
        urgency_normal = {
          background = "#111111";
          foreground = "#FFFFFF";
          timeout = 10;
        };
        urgency_critical = {
          background = "#660A1E";
          foreground = "#FFFFFF";
          timeout = 0;
        };
      };
    };
  };
}
