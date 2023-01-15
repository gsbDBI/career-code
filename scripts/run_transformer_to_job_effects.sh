#!/bin/sh
#
#SBATCH -t 24:00:00
#SBATCH -c 8
#SBATCH -C GPU_SKU:V100_SXM2
#SBATCH --gpus 1
#SBATCH --mem-per-cpu 8G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=owners

NAME=full_zippia_edu_year_ethnicity_gender_state_edu_to_job_effects_no_fp16_1000_max_tokens_32_emb_dim_5e_5_lr
python ~/FOW_2.0/src/fairseq/train.py --task labor_modeling \
  /oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_full_edu \
  --arch transformer_lm_gpt \
  --optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 \
  --clip-norm 0.0 \
  --lr 0.00005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
  --warmup-init-lr 1e-07 \
  --tokens-per-sample 512 --sample-break-mode eos \
  --max-tokens 1000 --update-freq 1 \
  --max-update 10000000 \
  --save-dir /oak/stanford/groups/athey/laborai/Zippia/checkpoints/$NAME \
  --tensorboard-logdir ~/FOW_2.0/src/fairseq/labor-logs/$NAME \
  --no-epoch-checkpoints  --save-interval-updates 20000 \
  --two-stage   --year-to-job-effects  --ethnicity-to-job-effects \
  --gender-to-job-effects  --state-to-job-effects  --education-to-job-effects  