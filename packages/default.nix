{ config, pkgs, ... }:

let
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  localPackages = import ./custom.nix { pkgs = pkgs; };
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; };

  cliPackages = with pkgs; [
    unzip
    wget
    git
    lazygit
    vim
    unstable.neovim
    zsh
    neofetch
    htop
  ];

  devPkgs = with pkgs; [
    nil
    nixfmt-classic

    rustc
    cargo

    gcc
    gnumake

    nodejs_22
    nodePackages.typescript
    nodePackages.typescript-language-server

    lua-language-server
    lua5_1
    lua51Packages.luarocks
    lua51Packages.lua-curl
  ];

  programPackages = with pkgs; [
    firefox
    alacritty
  ];

  otherPackages = with pkgs; [
    dmenu
    unstable.home-manager
  ];

in
{
  environment.systemPackages = cliPackages ++ devPkgs ++ programPackages ++ otherPackages;
}
