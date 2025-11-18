#!/bin/bash

run_commands(){
    eval template="$1"
    for train_frac in 0.5 0.4 0.3 0.2 0.1; do
        for ((i=1; i<=10; i++)); do
            run_param="${i}o10"
            eval "$1 --run $run_param --train_frac $train_frac"
        done
    done
}

cd src/

# Strats (ss-) physionet
template="python main.py --dataset physionet_2012 --model_type strats --hid_dim 64 --num_layers 2 --num_heads 16 --dropout 0.2 --attention_dropout 0.2 --lr 5e-4"
run_commands "\${template}"
