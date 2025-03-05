{
  pkgs,
  username,
  inputs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    users.${username} = {
      home = {
        stateVersion = "24.11"; # Don't change this
        inherit username;
        homeDirectory = "/home/${username}";
      };

      targets.genericLinux.enable = true;
      fonts.fontconfig.enable = true;

      programs = import ./programs.nix { inherit pkgs; };
    };

    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
