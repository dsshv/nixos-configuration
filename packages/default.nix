{ pkgs, ... }:

let
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  localPackages = import ./custom.nix { pkgs = pkgs; };
  # customPackages = with localPackages; [
  #   dwm
  # ];

  terminalPackages = with pkgs; [
    git
    vim
    neovim
    zsh
    neofetch
    alacritty
  ];

  browsers = with pkgs; [
    firefox
  ];

  otherPackages = with pkgs; [
    dmenu
  ];

in
{
    # environment.systemPackages = customPackages ++ terminalPackages ++ otherPackages;
    environment.systemPackages = terminalPackages ++ browsers ++ otherPackages;
}
