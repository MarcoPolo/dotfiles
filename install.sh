#!/usr/bin/env bash
set -e

sh <(curl -L https://nixos.org/nix/install)
. /home/codespace/.nix-profile/etc/profile.d/nix.sh

sudo mkdir -p /etc/nix
sudo cp nix.conf /etc/nix/nix.conf

sudo apt update -y
sudo apt -y install --no-install-recommends acl

# github codespaces fixes
if [ "${CODESPACES}" = true ]; then
  # vscode codespaces set default permissions on /tmp. These will
  # produce invalid permissions on files built with nix. This fix
  # removes default permissions set on /tmp
  echo "fixing perms"
  sudo setfacl --remove-default /tmp
fi

nix run github:nix-community/home-manager/release-22.11 -- switch --flake ".#codespace" -b backup