{ pkgs ? import <nixpkgs> { } }:
let script = builtins.readFile ./setup-devbox-server.sh; in
let setup-keys = import ./setup-keys.nix { inherit pkgs; }; in
let set-signing-key = import ./set-signing-key.nix { inherit pkgs; }; in
pkgs.writeShellScriptBin "setup-devbox-server" ''
  #!/bin/sh

  PATH=$PATH:${pkgs.coreutils}/bin

  setup_keys=${setup-keys}/bin/setup-keys
  set_signing_key=${set-signing-key}/bin/set-signing-key

  ${script}
''
