{
  pkgs,
  username,
  ...
}: let
  zpool = "dontdie";
in {
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix

    ../../bases/server.nix

    ../../components/services/sanoid.nix
    ../../components/services/zfs.nix
  ];

  boot.zfs.extraPools = [zpool];

  services.sanoid.datasets."${zpool}" = {
    recursive = true;
    process_children_only = true;
    use_template = ["default"];
  };

  services.tailscale.enable = true;

  home-manager.users.${username}.home.packages = [pkgs.age];
}
