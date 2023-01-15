#!/bin/sh
#
#SBATCH -t 30:00:00
#SBATCH -c 8
#SBATCH --gpus 1
#SBATCH --mem-per-cpu 8G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=owners

NAME=forecast_regression_final_one_job_year_with_unemployment_two_stage_learned_year_embeds_all_covs_except_gender_and_ethnicity_fp16
python ~/FOW_2.0/src/fairseq/train.py --task labor_modeling \
 /oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_forecast_final_one_job_year_with_unemployment \
  --arch regression \
  --optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 \
  --clip-norm 0.0 \
  --lr 0.0005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
  --warmup-init-lr 1e-07 \
  --tokens-per-sample 512 --sample-break-mode eos \
  --max-tokens 16000 --update-freq 1 \
  --max-update 85000 \
  --save-dir /oak/stanford/groups/athey/laborai/Zippia/checkpoints/$NAME \
  --tensorboard-logdir ~/FOW_2.0/src/fairseq/labor-logs/$NAME \
  --no-epoch-checkpoints --save-interval-updates 1000 \
  --second-order-markov --include-years-in-current-job --include-year \
  --year-difference --include-education --education-difference \
  --include-state \
  --two-stage --include-total-years --fp16