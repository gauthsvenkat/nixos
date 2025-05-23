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

        "custom/appmenu" = {
          format = "Apps";
          on-click = "tofi-drun --drun-launch=true";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };

        clock = {
          interval = 1;
          format = "{=%R=%S}  ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            weeks-pos = "left";
            format = {
              months = "<span color='#ffffff'><b>{}</b></span>";
              days = "<span color='#ffffff'><b>{}</b></span>";
              weeks = "<span color='#ffffff'><b>W{}</b></span>";
              weekdays = "<span color='#ffffff'><b>{}</b></span>";
              today = "<span color='#ffffff'><b><u>{}</u></b></span>";
            };
          };
        };

        modules-left = [
          "custom/appmenu"
          "hyprland/window"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "cpu"
          "memory"
          "clock"
        ];
      };
    };

    style = ''
      * {
          border-radius: 8px;
          font-family: JetBrainsMono;
          font-size: 16px;
      }

      window#waybar {
          background-color: transparent;
      }

      button {
          border: none;
      }
      button:hover {
          box-shadow: inset 0 -3px #ffffff;
      }

      tooltip {
          background-color: rgba(0,0,0,0.8);
      }

      #custom-appmenu,
      #window,
      #cpu,
      #memory,
      #clock {
          padding: 0 8px;
          border: 1px solid #ffffff;
          background-color: rgba(0,0,0,0.8);
      }
    '';
  };
}
