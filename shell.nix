{ pkgs ? import <nixpkgs> {} }: with pkgs;

let
  tex = texlive.combine {
    inherit (texlive)
    animate
    babel
    beamer
    chngcntr
    cleveref
    enumitem
    etoolbox
    excludeonly
    exercise
    fancyvrb
    float
    framed
    graphviz
    ifplatform
    keystroke
    kpfonts
    lineno
    listings
    ly1
    mdframed
    media9
    microtype
    minted
    mweights
    needspace
    ocgx2
    overpic
    pgf
    scheme-medium
    soul
    sourcesanspro
    titlesec
    todonotes
    upquote
    xcolor
    xcolor-solarized
    xstring
    wrapfig;
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
