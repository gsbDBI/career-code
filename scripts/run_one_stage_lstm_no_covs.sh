#!/bin/sh
#
#SBATCH -t 24:00:00
#SBATCH -c 8
#SBATCH --gpus 1
#SBATCH --mem-per-cpu 8G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=gpu

# NAME=lstm_final_one_job_year_with_unemployment_6_layers_1323_embed_dim_two_stage_fp16
NAME=lstm_final_one_job_year_with_unemployment_3_layers_435_embed_dim_one_stage_fp16
python ~/FOW_2.0/src/fairseq/train.py --task labor_modeling \
  /oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_final_one_job_year_with_unemployment \
  --arch lstm_lm \
  --optimizer adam --adam-betas '(0.9, 0.98)' \
  --lr 0.0005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
  --warmup-init-lr 1e-07 \
  --tokens-per-sample 512 --sample-break-mode eos \
  --max-tokens 16000 --update-freq 1 \
  --max-update 85000 \
  --save-dir /oak/stanford/groups/athey/laborai/Zippia/checkpoints/$NAME \
  --tensorboard-logdir ~/FOW_2.0/src/fairseq/labor-logs/$NAME \
  --no-epoch-checkpoints  --save-interval-updates 1000 \
  --decoder-layers 3  --decoder-embed-dim 435  \
  --fp16