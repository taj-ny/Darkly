{
  description = "Fork of breeze theme style that aims to be visually modern and minimalistic";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # <https://github.com/nix-systems/nix-systems>
    systems.url = "github:nix-systems/default-linux";
  };

  outputs =
    {
      nixpkgs,
      systems,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      perSystem =
        f:
        lib.genAttrs (import systems) (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      packages = perSystem (
        { pkgs }:
        rec {
          default = lightly-qt6;
          lightly-qt6 = pkgs.kdePackages.callPackage ./nix/package.nix { };
          lightly-qt5 = pkgs.libsForQt5.callPackage ./nix/package.nix { inherit lightly-qt6; };
        }
      );

    };
}
