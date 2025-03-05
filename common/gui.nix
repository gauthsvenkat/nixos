{ username, inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  services = {
    # Uncomment following to enable Xorg (beside wayland)
    # xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Allows pipewire to acquire realtime priority
  security.rtkit.enable = true;

  # Any self-respecting gui module needs a browser
  home-manager.users.${username}.programs.firefox.enable = true;

  programs.kdeconnect.enable = true;
}
