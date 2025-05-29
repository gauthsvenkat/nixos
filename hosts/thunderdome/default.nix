{
  username,
  ...
}:
let
  zpool = "wombocombo";
in
{
  imports = [
    ./hardware-configuration.nix

    ../../common/boot.nix
    ../../common/system.nix
    ../../common/users.nix
    ../../common/nix-settings.nix
    ../../common/gui/kde.nix
    ../../common/hyprland

    ../../common/personal.nix
    ../../common/development.nix

    ../../common/services/syncthing.nix
    ../../common/services/zfs.nix
  ];

  # If enabled, the boot process get randomly stuck on "A start job
  # is running for /dev/tpmrm0".
  systemd.tpm2.enable = false;

  boot.zfs.extraPools = [ zpool ];
  services.sanoid.datasets."${zpool}".use_template = [ "default" ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };

  users.users.${username}.extraGroups = [ "gamemode" ];

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];

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

    xdg.autostart.entries = [
      # NOTE: Disabled cause steam keeps opening randomly
      # "${pkgs.steam}/share/applications/steam.desktop"
    ];
  };
}
