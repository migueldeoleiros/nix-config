{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    home.file = {
      ".config/qutebrowser/homepage/homepage.html".source =
        ./homepage/homepage.html;

      ".config/qutebrowser/homepage/homepage.css".source =
        ./homepage/homepage.css;
    };
  };
}
