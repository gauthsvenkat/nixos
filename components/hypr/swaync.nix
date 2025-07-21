{
  config,
  ...
}: let
  inherit (config.hostCfg) username;
in {
  home-manager.users.${username}.services.swaync = {
    enable = true;
    settings = {
      image-visibility = "when-available";
      widgets = [
        "title"
        "mpris"
        "dnd"
        "notifications"
      ];
    };
  };
}
