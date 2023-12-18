{
  description = "bitestring.github.io";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      dependencies = with pkgs; [
        # system deps
        glibcLocales

        # Python deps
        ansible
        ansible-lint
        ansible-language-server

        # Nix deps
        nixpkgs-fmt
      ];

    in
    {
      # packages.${system}.default = pkgs.hello;

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = dependencies;
      };
    };
}
