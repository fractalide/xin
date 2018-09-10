let
  bootPkgs = import <nixpkgs> {};
  pinnedPkgs = bootPkgs.fetchFromGitHub {
    owner = "fractalide";
    repo = "racket2nix";
    rev = "8bce4cc234a6f2a327b61bb4c28f843cec90f550";
    sha256 = "095fpa1ipiwx4f67awggxnv8jfhnl1907gqvx45sj5lyw7mfskwk";
  };
in
import pinnedPkgs
