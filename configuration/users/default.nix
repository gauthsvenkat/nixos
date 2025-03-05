{ pkgs, home-manager, ... }:
let
  username = "ando";
  homeDirectory = "/home/${username}";
in
{
  imports = [ home-manager.nixosModules.home-manager ];

  users.users.${username} = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$pW5XKfCQHdWvfaAnWJeNQ1$y05/b6FGJR3jSfXdpnDw.l9uj/gvT/ulszsLKme5d18";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      home = {
        stateVersion = "24.11"; # Don't change this
        inherit username;
        inherit homeDirectory;
        packages = import ./packages.nix { inherit pkgs; };
      };

      targets.genericLinux.enable = true;
      fonts.fontconfig.enable = true;

      programs = import ./programs.nix { inherit pkgs; };
    };
  };
}
