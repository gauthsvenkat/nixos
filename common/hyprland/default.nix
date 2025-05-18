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
    hyprpaper.enable = true;
    # copyq.enable = true;
  };
}
