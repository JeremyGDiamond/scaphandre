# simple.nix
with (import <nixpkgs> {});
  mkShell {
    buildInputs = [
      cargo
      openssl
      openssl.dev
    ];

    shellHook = ''
    find /nix/store -name 'libssl.so*' -or -name 'libcrypto.so*' -exec ls -l {} \; 2>/dev/null
    echo "set export OPENSSL_DIR"
    echo "set export OPENSSL_LIB_DIR"
    echo "set export OPENSSL_INCLUDE_DIR"
    '';
  }
