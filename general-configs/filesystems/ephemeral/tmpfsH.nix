{ config, lib, pkgs, fsHome ... }: 

let 
	fs = fsHome;
in

{
  fileSystems = { 
  	"/safeH" = { 
      device = "/dev/disk/by-label/nixos";
      fsType = fs;
      options = [ "noatime" ];
    };
	};

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