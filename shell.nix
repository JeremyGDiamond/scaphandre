with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    cargo
    openssl
    pkg-config
  ];

  # These help Rust crates like openssl-sys find the right libs
  shellHook = ''
    export OPENSSL_DIR=${openssl.dev}
    export OPENSSL_LIB_DIR=${openssl.out}/lib
    export OPENSSL_INCLUDE_DIR=${openssl.dev}/include
    export OPENSSL_NO_VENDOR=1

    echo "OPENSSL_DIR=$OPENSSL_DIR"
    echo "OPENSSL_LIB_DIR=$OPENSSL_LIB_DIR"
    echo "OPENSSL_INCLUDE_DIR=$OPENSSL_INCLUDE_DIR"
  '';
}

