{config, ...}: let
  inherit (config.hostCfg) username;
in {
  imports = [
    ./hardware-configuration.nix

    ../../bases/laptop.nix
    ../../bases/personal.nix
    ../../bases/workstation-kde.nix

    ../../components/config.nix
  ];

  hostCfg = {
    hostname = "thinkpad";
    isLaptop = true;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = username;
  };
}
