{ config, lib, pkgs, ... }: {

  environment.persistence."/safe" = {
    enable = true;
    hideMounts = true;

    users.vulkce = {
      directories = [
        ".cache/nix"
        ".cache/flatpak"
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
        ".mozilla"
        ".themes"
        ".icons"
      ];
      files = [ 
        ".gitconfig" 
        ".env"
        ".gtkrc-2.0"
        ".nix-profile"
      ];
    };
  };
}