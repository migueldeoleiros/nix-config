{config, pkgs, inputs, vars, ...}:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  }; 

  home-manager.users.${vars.user} = {
    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
