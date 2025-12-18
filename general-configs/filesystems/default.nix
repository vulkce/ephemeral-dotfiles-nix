{ config, lib, pkgs, ... }: {

# -------- FILESYSTEM --------

  # nunca tocar
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # persistencia de um sistema efêmero
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/var/lib/nixos"
      "/var/lib/nixos-containers"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections" 
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  # TempHome
  specialisation = {
    Home = {
      inheritParentConfig = true; # herda a configuração pai
      configuration = {
        system.nixos.tags = [ "Home" ]; # define as tags no boot
        # home separada
        fileSystems."/home" = {
          device = "/dev/disk/by-label/home";
          fsType = "xfs";
          options = [ "noatime" "nofail" "x-systemd.device-timeout=5" ];
        };
      };
    };
    TempHome = {
      inheritParentConfig = true;
      configuration = {
        system.nixos.tags = [ "TempHome" ];
        # home interna
        fileSystems."/home" = {
          device = "none"; 
          fsType = "tmpfs"; # filesystem temporário na ram
          options = [ "size=8G" "mode=777" ]; # options para o tmpfs
        };
        # usa systemd para criar uma home
        systemd.tmpfiles.settings."10-home-vulkce" = {
          "/home/vulkce".d = {
            mode = "0755";
            user = "vulkce";
            group = "users";
          };
        };
      };
    };
  };
}