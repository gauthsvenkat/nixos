{
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ../../common/boot.nix
    ../../common/system.nix
    ../../common/users.nix
    ../../common/nix-settings.nix
    ../../common/gui/hyprland

    ../../common/personal.nix
    ../../common/development.nix
    ../../common/laptop.nix

    ../../common/services/syncthing.nix
    ../../common/services/kanata.nix
  ];

  home-manager.users.${username} = {
    services.hyprpaper.settings =
      let
        # NOTE: Make sure that the picture actually exists in the location!
        path = "/home/${username}/Pictures/wallpapers/astronaut.jpg";
      in
      {
        preload = path;
        wallpaper = ", ${path}";
      };
    programs.git.userEmail = "gauthsvenkat@gmail.com";
  };
}
