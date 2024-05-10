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

model_name=Crossformer

#for i in G01 G02 G03 G04 G05 G06 G07 G08 G09 G10 G12 G13 G14 G15 G16 G17 G18 G19 G20 G21 G22 G23 G24 G25 G26 G27 G29 G30 G31 G32;
#do

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/broadcast_ephemeris_error/ \
  --data_path G01 \
  --model_id broadcast_ephemeris_error_72_72_G01_test \
  --model $model_name \
  --data broadcast_ephemeris_error \
  --features M \
  --seq_len 72 \
  --label_len 36 \
  --pred_len 72 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 3 \
  --dec_in 3 \
  --c_out 3 \
  --des 'Exp' \
  --itr 1


#done



