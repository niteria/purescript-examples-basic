{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    mkSpagoDerivation.url = "github:jeslie0/mkSpagoDerivation";
    ps-overlay.url = "github:thomashoneyman/purescript-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, mkSpagoDerivation, ps-overlay }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ mkSpagoDerivation.overlays.default
                       ps-overlay.overlays.default ];
        };
      in
        {
          packages.default =
            pkgs.mkSpagoDerivation {
              spagoYaml = ./spago.yaml;
              spagoLock = ./spago.lock;
              src = ./.;
              nativeBuildInputs = [ pkgs.purs-unstable pkgs.spago-unstable pkgs.esbuild ];
              version = "0.1.0";
              buildPhase = "spago bundle --module Example.Basic.Main --outfile example.js";
              installPhase = ''
                mkdir $out;
                cp ${./dist/index.html} $out/index.html;
                cp example.js $out/example.js;
              '';
            };
          # devShells = {
          #   default = pkgs.mkShell {
          #     name = "my-purescript-project";
          #     inputsFrom = builtins.attrValues self.packages.${system};
          #     buildInputs = with pkgs; [
          #       purs
          #       spago-unstable
          #       purs-tidy-bin.purs-tidy-0_10_0
          #       purs-backend-es
          #     ];
          #   };
          # };
        }
    );
}
