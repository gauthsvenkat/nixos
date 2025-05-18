{ username, ... }:
{
  imports = [
    ./hyprland.nix
    ./tofi.nix
    ./waybar.nix
  ];

  home-manager.users.${username}.services = {
    dunst.enable = true;
    hyprpolkitagent.enable = true;
    #NOTE: hyprpaper.settings is set in the host itself
    hyprpaper.enable = true;
    # copyq.enable = true;
  };
}
