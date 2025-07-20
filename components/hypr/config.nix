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
      description = "terminal emulator for hyprland";
    };

    fileManager = mkOption {
      type = types.str;
      default = "${pkgs.kdePackages.dolphin}/bin/dolphin";
      description = "file manager for hyprland";
    };
  };
}
