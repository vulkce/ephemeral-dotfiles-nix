{ config, pkgs, ... }: {

  home = {
    username = "vulkce";
    homeDirectory = "/home/vulkce";
    stateVersion = "26.05";
    packages = with pkgs; [
      tree
      vesktop
      mission-center
      prismlauncher
      vscodium
      gnome-secrets
    ];
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "vulkce";
      user.email = "vulkce@proton.me";
    };
  };


}
