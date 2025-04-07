{
  description = "A flake for my python workspace.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = [
            pkgs.just
            pkgs.python3
            pkgs.poetry
            pkgs.pre-commit
          ];

          shellHook = ''
            echo "Activated Nix Shell"
          '';
        };
  };
}
