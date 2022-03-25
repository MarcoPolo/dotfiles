set -e

sh <(curl -L https://nixos.org/nix/install)
. /home/codespace/.nix-profile/etc/profile.d/nix.sh

sudo mkdir -p /etc/nix
sudo cp nix.conf /etc/nix/nix.conf