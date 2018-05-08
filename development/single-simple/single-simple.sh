#!/bin/bash

source "../../etc/variables.sh";

bash '../../etc/dependencies/docker.sh';
bash '../../etc/dependencies/docker.sh-compose';
bash '../../etc/dependencies/make.sh';

git clone https://github.com/bigchaindb/bigchaindb;
cd bigchaindb;
sudo make start;
