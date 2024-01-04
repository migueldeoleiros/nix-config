{config, pkgs, inputs, vars, ...}:

{
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
        background = "#090a11";
        foreground = "#afb4c0";
        timeout = 5;
      };
      urgency_normal = {
        background = "#13141b";
        foreground = "#d4dae8";
        timeout = 10;
      };
      urgency_critical = {
        background = "#660A1E";
        foreground = "#d4dae8";
        timeout = 0;
      };
    };
  };
  
}
