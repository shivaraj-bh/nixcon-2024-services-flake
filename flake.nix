{
  description = "Material from my NixCon 2024 talk on `services-flake`";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, lib, self', ... }: {
        imports = [
          ./nix/presenterm-export.nix
        ];
        apps.default.program = lib.getExe (pkgs.writeShellApplication {
          name = "start-presentation";
          runtimeInputs = [ pkgs.presenterm ];
          text = ''
            exec presenterm ${inputs.self}/presentation.md --present
          '';
        });

        # See https://mfontanini.github.io/presenterm/guides/pdf-export.html?highlight=pdf#pdf-export
        apps.exportPdf.program = lib.getExe (pkgs.writeShellApplication {
          name = "export-pdf";
          runtimeInputs = with pkgs; [
            presenterm
            # presenterm-export depends on `libtmux`
            tmux
            (python3.withPackages (_: [ self'.packages.presenterm-export ]))
          ];
          text = ''
            exec presenterm --export-pdf ./presentation.md
          '';
        });

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.presenterm ];
        };
      };
    };
}
