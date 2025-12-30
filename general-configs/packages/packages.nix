{ config, lib, pkgs, inputs, ... }: {

# -------- SYSTEM --------

  environment.systemPackages = with pkgs; [
    # coisas úteis
    usbutils
    wget
    kdePackages.qtstyleplugin-kvantum
    gparted
    fastfetch
    gnome-disk-utility

    # non-free
    unrar
    
    # desenvolvimento
    pipenv
    python314
    rustc
    nodejs
    devspace
    sqlitebrowser
    javaPackages.compiler.openjdk25

    # coisas para WMs & DEs
    alacritty
    wl-clipboard
    swaybg
    hyprpaper
    waybar
    labwc
  ];
}
