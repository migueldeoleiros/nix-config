{config, pkgs, inputs, vars, ...}:

{
  programs.i3status = {
    enable = true;
    general = {
      colors = false;
      interval = 10;
    };
    modules = {
      "ipv6".enable = false;
      "disk /".enable = false;
      "load".enable = false;
      "memory".enable = false;
      "tztime local".enable = false;
      "wireless _first_".enable = false;
      "ethernet _first_".enable = false;

      "wireless wlan0" = {
        position = 1;
        settings = {
          format_up = "W: (%quality at %essid)";
          format_down = "W: down";
        };
      };

      "battery all".enable = true;

      "volume master" = {
        position = 2;
        settings = {
          format = "♪: %volume";
          format_muted = "♪: muted (%volume)";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };

      "time" = {
        position = 4;
        settings = {
          format = "%d.%m.%Y %H:%M";
        };
      };
    };
  };
}
