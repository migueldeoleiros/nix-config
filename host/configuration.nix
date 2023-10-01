{ config, pkgs, lib, inputs, kmonad, vars, ... }:

{
  imports = (
    import ../modules/vm ++
    import ../modules/shell ++
    import ../modules/kmonad ++
    import ../modules/powersaver ++
    import ../modules/home
  );

  # Define a user account
  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "input" "uinput"];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    neovim
    tldr
    eza
    trash-cli
    ranger
    tmux
    gh
    neofetch
    python3
    lshw
    wine
    bat
    unzip
    wget
    ocaml
    ocamlPackages.utop
    emacsPackages.tuareg
    gcc
    sbcl
    libclang
    file
    wl-clipboard
    qemu
    htop
    texlive.combined.scheme-full
    gnumake
  ];

  # fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerdfonts
    lmodern
  ];  

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 8;
    };
    efi.canTouchEfiVariables = true;
  };

  # Garbage Collection
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Networking
  networking = {
    hostName = "nitro";
    # wireless.enable = true;
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "es_ES.UTF-8";
      LC_MEASUREMENT = "es_ES.UTF-8";
      LC_MONETARY = "es_ES.UTF-8";
      LC_PAPER = "es_ES.UTF-8";
      LC_TELEPHONE = "es_ES.UTF-8";
      LC_TIME = "es_ES.UTF-8";
    };
  };

  services = {
    xserver = { # Display manager and desktop
      enable = true;
      displayManager = {
        gdm.enable = true;
	      defaultSession = "gnome";
      };
      desktopManager.gnome.enable = true;
      libinput.enable = true; # Enable touchpad
    };
    printing = {
      enable = true; 
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "es";
    xkbOptions = "compose:ralt";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Set enviroment variables
  environment.variables = {
    EDITOR = "nvim";
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  # Nvidia GPU
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = { # Modesetting is required.
    modesetting.enable = true;

    # Enable power management (do not disable this unless you have a reason to).
    # Likely to cause problems on laptops and with screen tearing if disabled.
    powerManagement.enable = true;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    open = true;

    # Enable the Nvidia settings menu,
	  # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # You may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = true;

      # Make sure to use the correct Bus ID values for your system!
      amdgpuBusId = "PCI:1:0:0";
      nvidiaBusId = "PCI:5:0:0";
    };
  };

  system.stateVersion = "23.05";

  home-manager.users.${vars.user} = {
    home = {
      stateVersion = "23.05";
    };

    programs = {
      home-manager.enable = true;
    };
  };
}
