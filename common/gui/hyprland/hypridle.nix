{ username, pkgs, ... }:
{
  home-manager.users.${username}.services.hypridle = {
    enable = true;
    settings =
      let
        display_cmd = "hyprctl dispatch dpms";
        display_on = "${display_cmd} on";
        display_off = "${display_cmd} off";
        lock_cmd = "${pkgs.hyprlock}/bin/hyprlock";
      in
      {
        general = {
          after_sleep_cmd = display_on;
          lock_cmd = lock_cmd;
        };

        listener = [
          {
            timeout = 600;
            on-timeout = lock_cmd;
          }
          {
            timeout = 900;
            on-timeout = display_off;
            on-resume = display_on;
          }
        ];
      };
  };
}
