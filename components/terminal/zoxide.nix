{username, ...}: {
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
