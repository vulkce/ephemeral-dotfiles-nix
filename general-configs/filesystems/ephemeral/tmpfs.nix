{ config, lib, pkgs, ... }: {
	
  fileSystems = { 
    "/safe" = { 
      device = "/persist/safe";
      fsType = "none";
      options = [ "bind" ];
      depends = [ "/persist" ];
      neededForBoot = true;
    };
  };
  
  # Cria o diretório safe
  systemd.tmpfiles.rules = [
    "d /persist/safe 0755 root root -"
  ];

  environment.persistence."/safe"  = {
		enable = true;
		hideMounts = true;
    
		directories = [
		  "/etc/nixos"
		  "/var/lib/flatpak"
		  "/var/lib/nixos"
		  "/var/lib/nixos-containers"
		  "/var/lib/systemd/coredump"
		  "/var/lib/bluetooth"
		  "/etc/NetworkManager/system-connections" 
		];
		files = [
		  "/etc/machine-id"
		];
	};	
}