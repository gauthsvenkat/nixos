{ username, ... }:
{
  home-manager.users.${username}.programs.tofi = {
    enable = true;
  };
}
