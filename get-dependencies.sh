#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
  base-devel \
  cmake \
  libarchive \
  sdl3 \
  sdl3_image \
  sdl3_ttf \
  libinih \
  harfbuzz \
  spdlog \
  fmt \
  libxml2


echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Getting big-launcher source code and assets.."
echo "---------------------------------------------------------------"
git clone https://github.com/complexlogic/big-launcher.git
wget https://github.com/complexlogic/big-launcher/files/10326572/assets.zip

echo "Start building big-launcher.."
echo "---------------------------------------------------------------"

# If the application needs to be manually built that has to be done down here
