{ pkgs ? import <nixpkgs> {} }: with pkgs;

let
  tex = texlive.combine {
    inherit (texlive)
    animate
    babel
    beamer
    chngcntr
    cleveref
    exercise
    enumitem
    etoolbox
    excludeonly
    fancyvrb
    float
    framed
    graphviz
    ifplatform
    lineno
    listings
    mdframed
    media9
    microtype
    minted
    needspace
    ocgx2
    overpic
    pgf
    scheme-medium
    soul
    todonotes
    upquote
    xcolor
    xcolor-solarized
    xstring;
  };
in
stdenv.mkDerivation {
  name = "final-encoding";
  buildInputs = [
    tex
    which
    graphviz
    imagemagick
  ] ++ (with pythonPackages; [
    pygments
  ]);
}
