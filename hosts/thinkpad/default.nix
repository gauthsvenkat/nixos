{
  homeDirectory,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../bases/laptop.nix
    ../../bases/personal.nix
    ../../bases/workstation-hyprland.nix
  ];

  services.displayManager.autoLogin = {
    enable = true;
    user = username;
  };

  home-manager.users.${username}.services.hyprpaper.settings = let
    # NOTE: Make sure that the picture actually exists in the location!
    path = "${homeDirectory}/Pictures/wallpapers/astronaut.jpg";
  in {
    preload = path;
    wallpaper = ", ${path}";
  };
}
