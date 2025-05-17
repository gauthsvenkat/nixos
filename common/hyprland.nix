{ username, pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [ pkgs.kitty ];

  home-manager.users.${username}.wayland.windowManager.hyprland.settings =
    let
      terminal = "wezterm";
      mainMod = "SUPER";
    in
    {
      bind = [
        "${mainMod}, Enter, exec, ${terminal}"
      ];
    };
}
