{ lib, stdenv, fetchFromGitHub, pkg-config, cmake, curl, zlib, ffmpeg_3, glew, pcre
, rtmpdump, cairo, boost, SDL2, SDL2_mixer, libjpeg, pango, lzma, nasm
, llvm, glibmm
}:

stdenv.mkDerivation rec {
  pname = "lightspark";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = "lightspark";
    repo = "lightspark";
    rev = version;
    sha256 = "04wn6d6gmpf848x0yghw26m9syv0hm6q5dwqiw3fxhs155jjqfgv";
  };

  patchPhase = ''
    sed -i 's/SET(ETCDIR "\/etc")/SET(ETCDIR "etc")/g' CMakeLists.txt
  '';

  nativeBuildInputs = [ pkg-config cmake ];

  buildInputs = [
    curl zlib ffmpeg_3 glew pcre rtmpdump cairo boost SDL2 SDL2_mixer libjpeg
    pango lzma nasm llvm glibmm
  ];

  meta = with lib; {
    description = "Open source Flash Player implementation";
    homepage = "https://lightspark.github.io/";
    license = licenses.lgpl3;
    maintainers = with maintainers; [ jchw ];
    platforms = platforms.linux;
  };
}
