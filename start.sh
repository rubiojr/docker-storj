#!/bin/bash
set -e

export PATH=$PATH:/root/.nvm/versions/node/v7.10.0/bin/

storjshare daemon
storjshare start --config /storj-config

while true; do
  sleep 60
  storjshare status 
done
