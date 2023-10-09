{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      networkmanager_dmenu
      networkmanagerapplet
    ];

    home.file = {
      ".config/networkmanager-dmenu/config.ini".text = ''
        [dmenu]
          dmenu_command = rofi -dmenu -i
      '';
    };
  };
}
