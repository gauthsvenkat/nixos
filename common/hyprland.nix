{ username, pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [ ];

  home-manager.users.${username}.wayland.windowManager.hyprland.settings =
    let
      terminal = pkgs.wezterm;
      mainMod = "SUPER";
    in
    {
      bind = [
        "${mainMod}, Enter, exec, ${terminal}"
      ];
    };
}
