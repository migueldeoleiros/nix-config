{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      hyprpaper
    ];

    home.file = {
      ".config/hypr/hyprpaper.conf".text = ''
        preload = ~/wallpapers/wave.jpg
        wallpaper = eDP-1,~/wallpapers/wave.jpg
        wallpaper = HDMI-A-1,~/wallpapers/wave.jpg
      '';
    };
  };
}
