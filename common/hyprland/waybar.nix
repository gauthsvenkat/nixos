#TODO= Useful widgets and spice it up
{ username, ... }:
{
  home-manager.users.${username}.programs.waybar = {
    enable = true;
    settings = {
      main_bar = {
        layer = "top";
        position = "bottom";
        spacing = 4;

        modules-left = [
        ];

        modules-center = [
        ];

        modules-right = [
          "cpu"

          "bluetooth"
          "backlight"
          "battery"

          "clock"
        ];

        cpu.format = " {usage}%";

        bluetooth = {
          format-off = "󰂲";
          format-on = "";
          format-connected = "󰂱";
          tooltip-format = "{status} \n {num_connections} connected \n {device_alias}";
        };

        #TODO: Stuff like backlight and battery is only relevant for laptops. Enable it conditionally
        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃠"
          ];
          reverse-scrolling = true;
          scroll-step = 2.0;
          tooltip = false;
        };

        battery = {
          interval = 15;
          states = {
            warning = 40;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "{power}W | {time}";
        };

        clock = {
          interval = 1;
          format = " :%H:%M:%S";
          # TODO: Specific this in some global constants?
          timezone = "Europe/Amsterdam";
          tooltip-format = "%D";
        };
      };
    };
  };
}
