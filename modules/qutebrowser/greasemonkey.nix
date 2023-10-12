{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    home.file = {
      ".config/qutebrowser/greasemonkey/youtube-adblock.js".source =
        ./greasemonkey/youtube-adblock.js;

      ".config/qutebrowser/greasemonkey/return-youtube-dislike.js".source =
        ./greasemonkey/return-youtube-dislike.js;
    };
  };
}
