model_name=Transformer

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/broadcast_ephemeris_error/ \
  --data_path G20 \
  --model_id broadcast_ephemeris_error_72_72_G20 \
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

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/broadcast_ephemeris_error/ \
  --data_path G05 \
  --model_id broadcast_ephemeris_error_72_72_G05 \
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

