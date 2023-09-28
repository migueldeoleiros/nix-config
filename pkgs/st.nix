{ lib, stdenv, fetchFromGitHub, fontconfig, libX11, libXext, libXft, ncurses, pkg-config, ...}:

stdenv.mkDerivation {
  pname = "st";
  version = "0.8.5";

  src = fetchFromGitHub {
    owner = "migueldeoleiros";
    repo = "st";
    rev = "069000ab4cb92c93dd2b10055a20f313ed7eb1f3";
    hash = "sha256-Y/dV58GPc4d3K0YdKoxPpcWn9mEbXFH+cLZaTviazjM=";
  };

  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    fontconfig
    libX11
    libXext
    libXft
    ncurses
  ];

  installPhase = ''
    runHook preInstall

    TERMINFO=$out/share/terminfo make install PREFIX=$out

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/migueldeoleiros/st";
    description = "Suckless Terminal fork";
    license = licenses.mit;
    maintainers = with maintainers; [ migueldeoleiros ];
    platforms = platforms.linux;
  };
}
