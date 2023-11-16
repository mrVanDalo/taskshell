{
  description = "Taskwarrior shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
    (flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # nix build
      packages.default = self.packages.${system}.tasksh;
      packages.tasksh = pkgs.callPackage ./default.nix { };
    }
    ));
}
