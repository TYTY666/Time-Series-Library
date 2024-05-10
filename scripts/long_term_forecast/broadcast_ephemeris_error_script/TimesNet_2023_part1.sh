#!/bin/bash

#SBATCH --partition=gpu
#SBATCH --account=huzhigang
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1

cd $SLURM_SUBMIT_DIR

conda init bash  
conda init zsh

module load nvidia/cuda/10.2
conda activate tsLib

model_name=TimesNet

for i in G12 G13 G14 G15 G16 G17 G18 G19 G20;
do

/project2/tongyi/miniconda3/envs/tsLib/bin/python3  -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/broadcast_ephemeris_error/ \
  --data_path $i \
  --model_id broadcast_ephemeris_error_72_72_$i \
  --model $model_name \
  --data broadcast_ephemeris_error \
  --features M \
  --seq_len 72 \
  --label_len 36 \
  --pred_len 72 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 3 \
  --dec_in 3 \
  --c_out 3 \
  --des 'Exp' \
  --d_model 64 \
  --d_ff 64 \
  --top_k 5 \
  --itr 1 \
  --batch_size 128

done



