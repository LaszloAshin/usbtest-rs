#!/bin/sh -uex

sudo apt-get update
sudo apt-get install --yes \
	ca-certificates \
	curl \
	gcc \
	gcc-arm-linux-gnueabihf \
	vim

curl https://sh.rustup.rs -sSf | sh -s -- -y
. $HOME/.cargo/env
rustup target add armv7-unknown-linux-gnueabihf
cat >> ~/.cargo/config << EOF
[target.armv7-unknown-linux-gnueabihf]
linker = "arm-linux-gnueabihf-gcc"
EOF

