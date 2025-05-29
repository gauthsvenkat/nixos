#TODO: Option to sleep, shutdown and whatnot in lockscreen. Maybe even control spotify?
{ username, ... }:
{
  #NOTE: This needs to be enabled as well to set the pam module, which home-manager cannot do
  programs.hyprlock.enable = true;
  home-manager.users.${username}.programs.hyprlock = {
    enable = true;
    settings =
      let
        font = "Monospace";
      in
      {
        general = {
          hide_cursor = true;
          grace = 10;
        };

        animations = {
          enabled = true;
          bezier = "linear, 1, 1, 0, 0";
          animation = [
            "fadeIn, 1, 5, linear"
            "fadeOut, 1, 5, linear"
            "inputFieldDots, 1, 2, linear"
          ];
        };

        background = {
          path = "screenshot";
          blur_passes = 3;
        };

        input-field = {
          size = "20%, 5%";
          outline_thickness = 3;
          inner_color = "rgba(0, 0, 0, 0.0)";

          outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
          fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

          font_color = "rgb(143, 143, 143)";
          fade_on_empty = false;
          rounding = 15;

          font_family = font;
          placeholder_text = "password?";
          fail_text = "$PAMFAIL";

          dots_spacing = 0.3;

          position = "0, 0";
          halign = "center";
          valign = "center";
        };

        label = [
          {
            text = "$TIME";
            font_size = 90;
            font_family = font;

            position = "0, -10%";
            halign = "center";
            valign = "top";
          }
          {

            text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
            font_size = 25;
            font_family = font;

            position = "0, -20%";
            halign = "center";
            valign = "top";
          }
        ];
      };
  };
}
