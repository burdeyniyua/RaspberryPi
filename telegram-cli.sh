#!/bin/bash
sudo apt-get install libssl1.0-dev
git clone --recursive https://github.com/madler/zlib.git && cd zlib && ./configure
sudo make install
cd
sudo apt-get install git libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make
git clone --recursive https://github.com/vysheng/tg.git && cd tg
./configure
sudo make
