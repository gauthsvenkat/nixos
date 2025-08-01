{config, ...}: let
  inherit (config.hostCfg) username;
in {
  home-manager.users.${username}.programs = {
    zoxide = {
      enable = true;
      options = [
        "--cmd j"
      ];
    };
    zsh.oh-my-zsh.plugins = ["zoxide"];
  };
}
