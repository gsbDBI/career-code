#!/bin/sh
#
#SBATCH -t 14:00:00
#SBATCH -c 8
#SBATCH -C GPU_SKU:V100_SXM2
#SBATCH --gpus 1
#SBATCH --mem-per-cpu 8G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=owners

NAME=full_zippia_edu_year_ethnicity_gender_state_edu_fixed_effects_fp16
python ~/FOW_2.0/src/fairseq/train.py --task labor_modeling \
  /oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_full_edu \
  --arch transformer_lm_gpt \
  --optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 \
  --clip-norm 0.0 \
  --lr 0.0005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
  --warmup-init-lr 1e-07 \
  --tokens-per-sample 512 --sample-break-mode eos \
  --max-tokens 16000 --update-freq 1 \
  --max-update 100000 \
  --save-dir /oak/stanford/groups/athey/laborai/Zippia/checkpoints/$NAME \
  --tensorboard-logdir ~/FOW_2.0/src/fairseq/labor-logs/$NAME \
  --no-epoch-checkpoints  --save-interval-updates 1000 \
  --two-stage   --fp16  --year-fixed-effects  --ethnicity-fixed-effects \
  --gender-fixed-effects  --state-fixed-effects  --education-fixed-effects