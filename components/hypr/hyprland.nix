{
  config,
  ...
}: let
  inherit (config.hostCfg) username terminal fileManager;
  inherit (config.hyprCfg) launcher lockScreen playerctl;
in {
  programs.hyprland.enable = true;

  home-manager.users.${username} = {
    services.hyprpolkitagent.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;

      settings = let
        mainMod = "super";
      in {
        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          rounding_power = 2;
          active_opacity = 1.0;
          inactive_opacity = 1.0;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = true;

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master.new_status = "master";

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        input = {
          kb_layout = "us";
          follow_mouse = 1;

          touchpad.natural_scroll = true;
        };

        gestures.workspace_swipe = true;

        bind = [
          "${mainMod}, return, exec, ${terminal}"
          "${mainMod}, e, exec, ${fileManager}"
          "${mainMod}, space, exec, ${launcher}"
          "${mainMod}, o, exec, ${lockScreen}"

          "${mainMod}, escape, killactive"
          "${mainMod} shift, escape, exit"

          "${mainMod}, v, togglefloating"
          "${mainMod}, p, pseudo"

          "${mainMod}, h, movefocus, l"
          "${mainMod}, j, movefocus, d"
          "${mainMod}, k, movefocus, u"
          "${mainMod}, l, movefocus, r"

          "${mainMod} shift, h, movewindow, l"
          "${mainMod} shift, j, movewindow, d"
          "${mainMod} shift, k, movewindow, u"
          "${mainMod} shift, l, movewindow, r"

          "${mainMod}, 1, workspace, 1"
          "${mainMod}, 2, workspace, 2"
          "${mainMod}, 3, workspace, 3"
          "${mainMod}, 4, workspace, 4"
          "${mainMod}, 5, workspace, 5"
          "${mainMod}, 6, workspace, 6"
          "${mainMod}, 7, workspace, 7"
          "${mainMod}, 8, workspace, 8"
          "${mainMod}, 9, workspace, 9"
          "${mainMod}, 0, workspace, 10"

          "${mainMod} shift, 1, movetoworkspace, 1"
          "${mainMod} shift, 2, movetoworkspace, 2"
          "${mainMod} shift, 3, movetoworkspace, 3"
          "${mainMod} shift, 4, movetoworkspace, 4"
          "${mainMod} shift, 5, movetoworkspace, 5"
          "${mainMod} shift, 6, movetoworkspace, 6"
          "${mainMod} shift, 7, movetoworkspace, 7"
          "${mainMod} shift, 8, movetoworkspace, 8"
          "${mainMod} shift, 9, movetoworkspace, 9"
          "${mainMod} shift, 0, movetoworkspace, 10"
        ];

        bindm = [
          "${mainMod}, mouse:272, movewindow"
          "${mainMod}, mouse:273, resizewindow"
        ];

        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];

        bindl = [
          ", XF86AudioNext, exec, ${playerctl} next"
          ", XF86AudioPause, exec, ${playerctl} play-pause"
          ", XF86AudioPlay, exec, ${playerctl} play-pause"
          ", XF86AudioPrev, exec, ${playerctl} previous"
        ];

        windowrule = [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];
      };

      extraConfig = ''
        monitor=,preferred,auto,auto
      '';
    };
  };
}
