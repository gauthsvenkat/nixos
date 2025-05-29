{
  pkgs,
  username,
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Allows pipewire to acquire realtime priority
  security.rtkit.enable = true;

  programs.firefox.enable = true;

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      libreoffice-still
      mpv
    ];
    xdg.autostart.enable = true;
  };
}
