#!/bin/bash
#SBATCH --time=10:30:00
#SBATCH --mem-per-cpu=4G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=6
#SBATCH --output=logs/run_%A.out
#SBATCH --job-name=run_meld_baseline
#SBATCH -n 1

mkdir -p logs

source activate data2vec
for classifier in 'Sentiment' 'Emotion'
do
    for modality in 'text' 'audio' 'bimodal'
    do
        for stage in 'train' 'test' 
        do
            echo "$stage $classifier Classification on $modality"
            python baseline.py -classify ${classifier} -modality ${modality} -${stage}
        done
    done 
done