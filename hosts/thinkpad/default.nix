{username, ...}: {
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
}
