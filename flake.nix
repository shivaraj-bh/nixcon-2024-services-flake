{
  description = "Material from my NixCon 2024 talk on `services-flake`";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, lib, ... }: {
        apps.default.program = lib.getExe (pkgs.writeShellApplication {
          name = "start-presentation";
          runtimeInputs = [ pkgs.presenterm ];
          text = ''
            exec presenterm ${inputs.self}/presentation.md --present
          '';
        });
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.presenterm ];
        };
      };
    };
}
