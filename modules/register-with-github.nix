{ pkgs ? import <nixpkgs> { } }:
let script = builtins.readFile ./register-with-github.sh; in
let get-uuid = import ./get-uuid.nix { inherit pkgs; }; in
pkgs.writeShellScriptBin "register-with-github" ''
  #!/bin/sh

  # Add CoreUtils
  PATH=$PATH:${pkgs.coreutils}/bin
  # Add Curl
  PATH=$PATH:${pkgs.curl}/bin

  gpg=${pkgs.gnupg}/bin/gpg
  grep=${pkgs.gnugrep}/bin/grep
  sed=${pkgs.gnused}/bin/sed

  get_uuid=${get-uuid}/bin/get-uuid

  ${script}
''
