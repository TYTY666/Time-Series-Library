#!/bin/bash

#SBATCH --partition=a100x4
#SBATCH --account=huzhigang
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1

cd $SLURM_SUBMIT_DIR

conda init bash  
conda init zsh

module load nvidia/cuda/11.6
conda activate tsLib

model_name=Transformer


echo $1

/project2/tongyi/miniconda3/envs/tsLib/bin/python3.8 -u run.py --use_amp \
  --task_name long_term_forecast \
  --is_training 0 \
  --root_path ./dataset/broadcast_clk_ephemeris_error_60s/ \
  --data_path $1 \
  --model_id broadcast_clk_ephemeris_error_60s_360_60_$1 \
  --model $model_name \
  --data broadcast_clk_ephemeris_error_60s \
  --features M \
  --seq_len 360 \
  --label_len 180 \
  --pred_len 60 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 1 \
  --dec_in 1 \
  --c_out 1 \
  --des 'Exp' \
  --itr 1 \
  --batch_size 1


