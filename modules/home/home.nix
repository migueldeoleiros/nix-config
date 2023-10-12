{ config, pkgs, lib, vars, ... }:

{
  home-manager.users.${vars.user} = {
    home.username = "miguel";
    home.homeDirectory = "/home/miguel";

    home.stateVersion = "23.05";
    
    home.packages = with pkgs; [
      firefox
      thunderbird
      emacs29-pgtk
      libreoffice
      kitty
      mpv
      telegram-desktop
      amberol
      evince
      lutris
      gradience
      steam
      webcord
      gnome.gnome-font-viewer
      gnome.nautilus
      gnome.eog
      qbittorrent
      pixelorama
      gimp
      inkscape
      (pkgs.callPackage ../../pkgs/st.nix {})
    ];

    xdg.mimeApps.defaultApplications = {
      "text/html" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    };
    
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;
      
      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };
    
    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/miguel/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    home.sessionVariables = {
      # EDITOR = "emacs";
    };
  };
}
