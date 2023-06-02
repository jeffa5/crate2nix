{
  description = "crate2nix";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    crate2nix = import ./default.nix {inherit nixpkgs pkgs;};
  in {
    packages.${system} = {
      inherit crate2nix;
    };

    overlays.default = final: prev: {
      inherit crate2nix;
    };

    devShells.${system}.default = import ./shell.nix {inherit nixpkgs pkgs;};
  };
}
