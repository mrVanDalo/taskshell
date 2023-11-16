{ lib, stdenv, cmake, readline }:

stdenv.mkDerivation rec {
  pname = "tasksh";
  version = "1.2.0";

  src = ./.;

  buildInputs = [ readline ];
  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    description = "REPL for taskwarrior";
    homepage = "http://tasktools.org";
    license = licenses.mit;
    maintainers = with maintainers; [ matthiasbeyer ];
    platforms = platforms.unix;
  };
}
