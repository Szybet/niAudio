#!/bin/bash
mkdir qt-kobo
cd qt-kobo
sudo apt-get install git
git clone https://github.com/koreader/koxtoolchain
cd koxtoolchain



sudo apt-get install build-essential autoconf automake bison flex gawk libtool libtool-bin libncurses-dev curl file git gperf help2man texinfo unzip wget
wget https://www.openssl.org/source/openssl-1.1.1n.tar.gz
tar -xf openssl-1.1.1n.tar.gz
cd openssl-1.1.1n
