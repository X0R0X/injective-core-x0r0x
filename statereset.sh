!#/bin/bash
injectived tendermint unsafe-reset-all --home $HOME/.injectived --keep-addr-book
rm -r ~/.injectived/wasm
wget -O wasmonly.tar.lz4 https://snapshots.polkachu.com/wasm/injective/wasmonly.tar.lz4 --inet4-only
lz4 -c -d wasmonly.tar.lz4  | tar -x -C $HOME/.injectived
rm wasmonly.tar.lz4
