{ stdenv, fetchurl, libarchive, python3, which, file }:

# We use this instead of the upstream remarkable-toolchain because the
# latter uses the wrong python3

stdenv.mkDerivation rec {
  pname = "rm2-toolchain-bin-${version}";
  version = "3.1.2";
  src = fetchurl {
    url = "https://storage.googleapis.com/remarkable-codex-toolchain/codex-x86_64-cortexa7hf-neon-rm11x-toolchain-${version}.sh";
    sha256 = "11wky7ww50kh9sqvrm6xcadwqz9fbn1a7grri43ir8rgp52h78r4";
    executable = true;
  };
  nativeBuildInputs = [ libarchive python3 which file ];
  phases = [ "patchPhase" "installPhase" ];
  installPhase = ''
    mkdir -p $out
    ENVCLEANED=1 $src -y -d $out
  '';
}
