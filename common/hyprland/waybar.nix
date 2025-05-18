#TODO: Useful widgets and spice it up
{ username, ... }:
{
  home-manager.users.${username}.programs.waybar = {
    enable = true;
  };
}
