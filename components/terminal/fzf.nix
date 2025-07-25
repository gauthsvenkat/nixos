{config, ...}: let
  inherit (config.hostCfg) username;
in {
  home-manager.users.${username}.programs = {
    fzf.enable = true;
    zsh.oh-my-zsh.plugins = ["fzf"];
    mcfly.fzf.enable = true;
  };
}
