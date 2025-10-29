{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  # Include C++ headers for regular clang calls:
  NIX_CFLAGS_COMPILE = lib.optionals stdenv.isDarwin [
    "-I${lib.getDev libcxx}/include/c++/v1"
  ];

  nativeBuildInputs =
    [
    ]
    ++ lib.optionals stdenv.isDarwin [
      # Add any Apple framework libraries your package needs, e.g.
      darwin.apple_sdk.frameworks.IOKit
    ];

}
