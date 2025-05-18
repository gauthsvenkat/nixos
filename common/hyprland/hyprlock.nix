{ username, ... }:
{
  #NOTE: This needs to be enabled as well to set the pam module, which home-manager cannot do
  programs.hyprlock.enable = true;
  home-manager.users.${username}.programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 10;
      };
      background = {
        path = "screenshot";
        blur_passes = 3;
      };
    };
  };
}
