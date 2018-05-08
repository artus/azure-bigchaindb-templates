#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd "$DIR";

source "../../etc/variables.sh";

bash '../../etc/dependencies/docker.sh';
bash '../../etc/dependencies/docker-compose.sh';
bash '../../etc/dependencies/make.sh';

git clone https://github.com/bigchaindb/bigchaindb;
cd bigchaindb;
docker-compose build bigchaindb;
docker-compose up -d bdb;
