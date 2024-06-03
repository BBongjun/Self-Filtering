#!/bin/bash

for dataset in cifar10; do
    for noise_mode in sym pair instance; do
        for seed in 123; do
            log_file="./figure_10/log/${dataset}_noise_${noise_mode}_seed_${seed}_R_${without_R}_Lcr_${without_Lcr}.txt"
            # Run Python script with specific parameters and append results to the log file
            python main.py --dataset $dataset --model resnet18 --save_sel_sam 1 --batch_size 32 --warm_up 10 --num_epochs 75 --learning_rate 0.02 --noise_mode $noise_mode --r 0.4 --seed_model $seed --gpuid 0 --fig_7 0 | tee -a $log_file
        done
    done
done