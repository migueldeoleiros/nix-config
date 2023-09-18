{ config, pkgs, ... }:

{
  home.username = "miguel";
  home.homeDirectory = "/home/miguel";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    firefox
    thunderbird
    emacs
    libreoffice
    kitty
    vlc
    telegram-desktop
    amberol
    evince
    lutris
    gradience
    steam
    discord
    eclipses.eclipse-jee
    vscode
    gnome.gnome-font-viewer
    gnome.gnome-tweaks
    qbittorrent
  ];

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

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      #vi mode
      bindkey -v
      export KEYTIMEOUT=1
      bindkey "^?" backward-delete-char
      # Change cursor shape for different vi modes.
      function zle-keymap-select {
        if [[ ''${KEYMAP} == vicmd ]] ||
           [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'
        elif [[ ''${KEYMAP} == main ]] ||
             [[ ''${KEYMAP} == viins ]] ||
             [[ ''${KEYMAP} = ' ' ]] ||
             [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'
        fi
      }
      zle -N zle-keymap-select
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Get editor completions based on the config schema
      "$schema" = "https://starship.rs/config-schema.json";

      # Inserts a blank line between shell prompts
      add_newline = true;

      character = {
        success_symbol = "[❯](bold green)";
      };
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    #basic aliases
    tmux="tmux -2";
    sudosu="sudo -Es";
    sudo="sudo ";
    poweroff="sudo poweroff";
    mv="mv -i";
    #rm="rm -i";
    cp="cp -i";
    df="df -h";
    ".."="cd ..";
    "..."="cd ../..";
    vim="nvim";
    diff="diff --color";
    e="emacsclient --tty";
    
    #use trash-cli instead of rm
    rm="trash-put";
    
    #improved find
    find="fd";
    
    #use ranger to move around directories
    rn=". ranger";
    
    #process check
    psuser="ps -u miguel";
    
    # eza instead of ls
    ls="eza -s extension --group-directories-first";
    ll="eza -ls extension --group-directories-first";
    lla="eza -las extension --group-directories-first";
    la="eza -as extension --group-directories-first";
    
    #open programs
    op="xdg-open";
    
    #git aliases
    gitlog="git log --decorate --color=always --pretty=tformat:\"%C(auto)%h %ce %s %d\" --graph";
    
    #check the weather in Coruna
    weather="curl wttr.in/Coruna";
  };
}
