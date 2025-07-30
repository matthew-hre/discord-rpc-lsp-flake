{
  description = "discord-rpc-lsp";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages.default = pkgs.buildGoModule rec {
        pname = "discord-rpc-lsp";
        version = "unstable-2025-07-29";
        src = ./.;

        vendorHash = "sha256-lYmhaB2GmBo2WGSLT4uKcNe8YEqMXf1R3OZ6xuKxCKY=";
      };
    });
}
