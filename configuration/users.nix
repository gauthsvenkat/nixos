{ pkgs, ... }:
{
  users.users.ando = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$pW5XKfCQHdWvfaAnWJeNQ1$y05/b6FGJR3jSfXdpnDw.l9uj/gvT/ulszsLKme5d18";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
