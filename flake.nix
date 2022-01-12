{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {

    packages.x86_64-linux.hello = pkgs.stdenv.mkDerivation rec {
      pname = "hello";
      version = "0.1";
      
      src = ./hello;

      unpackPhase = ''true'';
      dontConfigure = true;
      dontBuild = true;
      dontStrip = true;

      nativeBuildInputs = [ pkgs.autoPatchelfHook ];

      installPhase = ''
        mkdir -p $out/bin
	ls -la
        pwd
        cp ${src} $out/bin/hello
      '';
    };

  };
}
