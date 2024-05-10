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

for i in  G11 G12 G13 G14 G15 G16 G17 G18 G19 G20 G32;
do

/project2/tongyi/miniconda3/envs/tsLib/bin/python3  -u run.py --use_amp \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/broadcast_clk_ephemeris_error/ \
  --data_path $i \
  --model_id broadcast_clk_ephemeris_error_72_72_$i \
  --model $model_name \
  --data broadcast_clk_ephemeris_error \
  --features M \
  --seq_len 720 \
  --label_len 360 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 1 \
  --dec_in 1 \
  --c_out 1 \
  --des 'Exp' \
  --itr 1 \
  --batch_size 512

done



