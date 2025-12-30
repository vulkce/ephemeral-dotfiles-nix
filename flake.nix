{
  description = "MEOW!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-flatpak,
    nixpkgs-stable,
    nixpkgs,
    impermanence,
    home-manager,
  }: {
    nixosConfigurations.flake = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./general-configs/system.nix # importa as configs do sistema
        ./general-configs/filesystem.nix # importa as configurações padrões de particionamento
        ./general-configs/interfaces.nix # importa as interfaces
        ./general-configs/packages/packages.nix # importa os pacotes
        ./general-configs/packages/special-pkgs.nix # importa pacotes especiais

        nix-flatpak.nixosModules.nix-flatpak
        impermanence.nixosModules.impermanence
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs.flake-inputs = inputs;
          
          home-manager.users.vulkce.imports = [
            flatpaks.homeManagerModules.nix-flatpak
            ./home-manager/home.nix
            ./flatpak.nix
          ];
        }
      ];
    };
  };
}
