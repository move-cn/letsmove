# SPDX-FileCopyrightText: 2021 Serokell <https://serokell.io/>
#
# SPDX-License-Identifier: CC0-1.0
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          lib,
          ...
        }:
        with pkgs;
        {
          packages.default = stdenv.mkDerivation {
            name = "corepack-shims";
            buildInputs = [ nodejs ];
            phases = [ "installPhase" ];
            installPhase = ''
              mkdir -p $out/bin
              corepack enable --install-directory=$out/bin
            '';
          };
          devShells.default =
            let
              lib-path = lib.makeLibraryPath (
                with pkgs;
                lib.optionals stdenv.isLinux [
                  nixfmt-rfc-style
                  stdenv.cc.cc
                ]
              );
            in
            pkgs.mkShell {
              buildInputs = with pkgs; [
                nixfmt-rfc-style
                nixd
                nodejs
                self'.packages.default
              ];
              LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${lib-path}";
            };
        };
    };
}
