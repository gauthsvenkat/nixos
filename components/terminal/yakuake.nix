{
  config,
  pkgs,
  ...
}: let
  inherit (config.hostCfg) username homeDirectory;
in {
  home-manager.users.${username} = {
    home = {
      packages = [pkgs.kdePackages.yakuake];

      file."${homeDirectory}/.config/yakuakerc".text = ''
        [Desktop Entry]
        DefaultProfile=default.profile

        [Dialogs]
        FirstRun=false

        [Shortcuts]
        new-session=Alt+T
        next-session=Alt+N
        next-terminal=Alt+L
        previous-session=Alt+B
        previous-terminal=Alt+H
        split-left-right=Alt+V

        [Window]
        KeepOpen=false
      '';
    };

    xdg.autostart.entries = [
      "${pkgs.kdePackages.yakuake}/share/applications/org.kde.yakuake.desktop"
    ];
  };
}
