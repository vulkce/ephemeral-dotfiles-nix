{ config, lib, inputs, pkgs, ... }: {

  # xserver
  services.xserver.enable = true;

# -------- LOGIN --------

  # SDDM
  services.displayManager.sddm.enable = false;
  services.displayManager.sddm.wayland.enable = false;
  services.displayManager.cosmic-greeter.enable = true;

# -------- DEs --------

  # PLASMA
  services.desktopManager.plasma6.enable = false;

  # COSMIC
  services.desktopManager.cosmic.enable = true;

  # GNOME
  services.desktopManager.gnome.enable = false;

  # XFCE
  services.xserver.desktopManager.xfce.enable = true;

  # cinnamon
  services.xserver.desktopManager.cinnamon.enable = false;

  # evitar conflito entre gnome e kde
 # programs.ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";


# -------- WMs -------- 

  # hyprland
  programs.hyprland = {  
    enable = false;
    xwayland.enable = true;
  }; 

  # i3 WM
  services.xserver.windowManager.i3.enable = false;

  # sway
  programs.sway.enable = false;

  # openbox
  services.xserver.windowManager.openbox.enable = false;

# -------- EXCLUDE --------

  # remover o bloatware do gnome
  environment.gnome.excludePackages = (with pkgs; [
    atomix
    cheese
    epiphany
    geary
    gnome-music
    gnome-photos
    gnome-tour
    hitori
    iagno
    tali
    totem
 ]);

}
