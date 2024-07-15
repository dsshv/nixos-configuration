{ config, pkgs, ...}:
let
  localPkgs = import ./packages/default.nix { pkgs = pkgs; };
in
{
  home = {
    username = "ilmk";
    homeDirectory = "/home/ilmk";

    file = {
      ".config/nvim".source = ./config/nvchad;
    };
  };
}
