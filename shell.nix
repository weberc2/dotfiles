{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = [
    nixpkgs.ripgrep
    nixpkgs.fzf
    nixpkgs.neovim
    nixpkgs.fd
    nixpkgs.go
    nixpkgs.cargo
    nixpkgs.vscode
    nixpkgs.jq
  ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
  }
