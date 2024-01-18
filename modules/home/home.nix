{ config, pkgs, lib, vars, ... }:

{
  home = {
    username = "${vars.user}";
    homeDirectory = "/home/${vars.user}";

    stateVersion = "23.05";

    sessionVariables = {
      EDITOR = "nvim";
    };
    
    packages = with pkgs; [
      alacritty
      neovim
      tldr
      tmux
      gh
      firefox
      thunderbird
      libreoffice
      emacs
      mpv
      telegram-desktop
      amberol
      evince
      webcord
      gradience
      gnome.gnome-font-viewer
      gnome.nautilus
      gnome.gvfs
      gnome.eog
      gnome.pomodoro
      qbittorrent
      pixelorama
      gimp
      inkscape
      anki
      (pkgs.callPackage ../../pkgs/st.nix {})
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
  };
}
