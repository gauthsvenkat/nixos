{ username, ... }:
{
  imports = [
    ../default.nix

    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./tofi.nix
    ./waybar.nix
  ];

  programs.hyprland.enable = true;

  home-manager.users.${username} = {
    services = {
      dunst.enable = true;
      hyprpolkitagent.enable = true;
      #NOTE: hyprpaper.settings is set in the host itself
      hyprpaper.enable = true;
    };
  };
}
