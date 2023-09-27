{ pkgs, lib, kmonad, ... } :

{
  services.kmonad ={
    enable = true;

    #keyboards."nitro" = {
      #device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
      #config = builtins.readFile ./nitro_config.kbd;
    #};

    keyboards."nt75" = {
      device = "/dev/input/by-id/usb-Evision_USB_DEVICE-event-kbd";
      config = builtins.readFile ./nt75_config.kbd;
    };
  };
  
  environment.systemPackages = [ kmonad.packages.${pkgs.system}.default ];
}
