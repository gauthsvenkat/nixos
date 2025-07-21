# Extends the top-level config.nix with hyprland-specific configuration options
{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.hostCfg.hyprCfg = {
    mainMod = mkOption {
      type = types.str;
      default = "super";
      description = "main modifier key for hyprland keybindings";
    };

    terminal = mkOption {
      type = types.str;
      default = "${pkgs.wezterm}/bin/wezterm";
      description = "terminal emulator";
    };

    fileManager = mkOption {
      type = types.str;
      default = "${pkgs.kdePackages.dolphin}/bin/dolphin";
      description = "file manager";
    };

    notificationToggle = mkOption {
      type = types.str;
      default = "${pkgs.swaynotificationcenter}/bin/swaync-client -t";
      description = "toggle notification center";
    };

    launcher = mkOption {
      type = types.str;
      default = "${pkgs.tofi}/bin/tofi-drun --drun-launch=true";
      description = "application launcher";
    };
  };
}
