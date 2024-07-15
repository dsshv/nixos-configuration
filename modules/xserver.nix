{ pkgs, ... }:
{
  services.xserver = {
    # Enable the x11 windowing system;
    enable = true;

    displayManager = {
      # Enable the GNOME Desktop Enviroment;
      gdm.enable = true;
    };

    windowManager = {
      # DWM tiling window manager;
      dwm = {
        enable = true;
	# package = pkgs.dwm.overrideAttrs {
	#   src = src;
	# };
      };
    };
  };
}
