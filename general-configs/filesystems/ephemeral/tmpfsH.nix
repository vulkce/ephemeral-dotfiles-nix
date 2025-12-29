{ config, lib, pkgs, ... }: {

  fileSystems = { 
    "/safeH" = { 
      device = "/persist/safeH";
      fsType = "none";
      options = [ "bind" ];
      depends = [ "/persist" ];
      neededForBoot = true;
    };
  };
  
  # cria o diretório safeH
  systemd.tmpfiles.rules = [
    "d /persist/safeH 0755 root root -"
  ];

  environment.persistence."/safeH" = {
    enable = true;
    hideMounts = true;

    users.vulkce = {
      directories = [
        ".cache/nix"
        ".ssh"
        "Desktop"
        "Pictures"
        "Projects"
        "Videos"
        ".config"
        ".local/share"
        ".var"
        ".nix-defexpr"
        ".pki"
      ];
      files = [ 
        ".gitconfig" 
        ".env"
        ".gtkrc-2.0"
      ];
    };
  };
}