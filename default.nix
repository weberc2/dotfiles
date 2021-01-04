{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = [
    nixpkgs.wget

    nixpkgs.ripgrep
    nixpkgs.fzf
    nixpkgs.neovim
    nixpkgs.fd
    nixpkgs.go
    nixpkgs.cargo
    nixpkgs.gitAndTools.gh
    nixpkgs.vscode
    nixpkgs.jq
    nixpkgs.tmux
    nixpkgs.postgresql # psql
    nixpkgs.oathToolkit # oathtool (automatically generate MFA codes)
    nixpkgs.awscli

    nixpkgs.kubectl
    nixpkgs.kubernetes-helm
    nixpkgs.kubectx
  ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
  }
