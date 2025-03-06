{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../common/boot.nix
    ../../common/nix-settings.nix
    ../../common/system.nix
    ../../common/users.nix
    ../../common/gui.nix
    ../../common/kanata.nix
    ../../common/laptop.nix
    ../../common/home-manager/personal.nix
    ../../common/home-manager/development.nix
  ];

  networking.hostName = "thinkpad";

  services = {
    mullvad-vpn = {
      enable = true;
      # pkgs.mullvad only contains the cli
      # while pkgs.mullvad-vpn comes with the gui as well
      package = pkgs.mullvad-vpn;
    };

    kanata.keyboards.laptop.devices = [
      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
    ];
  };
}
