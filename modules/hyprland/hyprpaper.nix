{config, pkgs, inputs, vars, ...}:

{
  home = {
    packages = with pkgs; [
      hyprpaper
    ];

    file = {
      ".config/hypr/hyprpaper.conf".text = ''
        preload = ~/wallpapers/darkWhosh.png
        wallpaper = eDP-1,~/wallpapers/darkWhosh.png
        wallpaper = HDMI-A-1,~/wallpapers/darkWhosh.png
      '';
    };
  };
}
