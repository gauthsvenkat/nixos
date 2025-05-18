{ username, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home-manager.users.${username} = {
    programs = {
      tofi = {
        enable = true;
        settings = {
          width = "100%";
          height = "100%";
          border-width = 0;
          outline-width = 0;
          padding-left = "35%";
          padding-top = "35%";
          result-spacing = 25;
          num-results = 5;
          font = "monospace";
          background-color = "#000A";
        };
      };

      hyprlock = {
        enable = true;
        #TODO: You can configure widgets here
        settings.general.grace = 10;
      };
    };

    services = {
      dunst.enable = true;
      hyprpolkitagent.enable = true;
      #NOTE: hyprpaper.settings is set in the host itself
      hyprpaper.enable = true;

      hypridle = {
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
    };
  };
}
