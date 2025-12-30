{ config, lib, pkgs, ... }: {

  environment.persistence."/safe" = {
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
        ".vscode-oss"
      ];
      files = [ 
        ".gitconfig" 
        ".env"
        ".gtkrc-2.0"
      ];
    };
  };
}