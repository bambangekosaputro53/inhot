#!/bin/bash

# Generate random worker ID
WORKER_ID=$(shuf -n 1 -i 1-999)

# Run the miner
./iniminer-linux-x64 --pool stratum+tcp://0x1bE17413356722a411033303EF7D8A13768fdF83.$WORKER_ID@pool-core-testnet.inichain.com:32672 --cpu-devices 1 --cpu-devices 2
