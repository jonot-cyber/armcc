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
      arm40771 = pkgs.callPackage ./default.nix {};
      arm40821 = arm40771.overrideAttrs { version = "4.0.821"; __intentionallyOverridingVersion = true; };
      arm411049 = arm40771.overrideAttrs { version = "4.1.1049"; __intentionallyOverridingVersion = true; };
      arm411440 = arm40771.overrideAttrs { version = "4.1.1440"; __intentionallyOverridingVersion = true; };
      arm411454 = arm40771.overrideAttrs { version = "4.1.1454"; __intentionallyOverridingVersion = true; };
      arm41561 = arm40771.overrideAttrs { version = "4.1.561"; __intentionallyOverridingVersion = true; };
      arm41713 = arm40771.overrideAttrs { version = "4.1.713"; __intentionallyOverridingVersion = true; };
      arm41791 = arm40771.overrideAttrs { version = "4.1.791"; __intentionallyOverridingVersion = true; };
      arm41894 = arm40771.overrideAttrs { version = "4.1.894"; __intentionallyOverridingVersion = true; };
      arm41921 = arm40771.overrideAttrs { version = "4.1.921"; __intentionallyOverridingVersion = true; };
      arm50482 = arm40771.overrideAttrs { version = "5.04.82"; __intentionallyOverridingVersion = true; };
      arm40 = arm40821;
      arm41 = arm411454;
      arm504 = arm50482;
      default = arm504;
    };
  });
}
