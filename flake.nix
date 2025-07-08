{
  description = "ARM Embedded Compilers for Decompilations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, flake-utils}: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
  in {
    packages = rec {
      arm40771 = pkgs.callPackage ./default.nix { pversion = "4.0.771"; };
      arm40821 = pkgs.callPackage ./default.nix { version = "4.0.821"; };
      arm411049 = pkgs.callPackage ./default.nix { pversion = "4.1.1049"; };
      arm411440 = pkgs.callPackage ./default.nix { pversion = "4.1.1440"; };
      arm411454 = pkgs.callPackage ./default.nix { pversion = "4.1.1454"; };
      arm41561 = pkgs.callPackage ./default.nix { pversion = "4.1.561"; };
      arm41713 = pkgs.callPackage ./default.nix { pversion = "4.1.713"; };
      arm41791 = pkgs.callPackage ./default.nix { pversion = "4.1.791"; };
      arm41894 = pkgs.callPackage ./default.nix { pversion = "4.1.894"; };
      arm41921 = pkgs.callPackage ./default.nix { pversion = "4.1.921"; };
      arm50482 = pkgs.callPackage ./default.nix { pversion = "5.04.82"; };
      arm40 = arm40821;
      arm41 = arm411454;
      arm504 = arm50482;
      default = arm504;
    };
  });
}
