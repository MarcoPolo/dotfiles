set -e

git submodule update --init


if [[ "$(hostname)" == *"codespaces_"* ]]; then
  echo "It's there."
  mkdir -p ~/.config/nix
  echo "sandbox = false" > ~/.config/nix/nix.conf
  ./home/quickDevSetup.sh
fi
