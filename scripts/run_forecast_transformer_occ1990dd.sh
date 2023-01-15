#!/bin/sh
#
#SBATCH -t 10:00:00
#SBATCH -c 8
#SBATCH --gpus 1
#SBATCH --mem-per-cpu 8G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=owners

NAME=occ1990dd_for_transformer_forecast_one_job_year_without_unemployment_all_embeds_fp16_12_layers_192_embed_768_ffn_3_heads_skip_gender_and_ethnicity
python ~/FOW_2.0/src/fairseq/train.py --task labor_modeling \
  /oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_forecast_one_job_year_without_unemployment_nilf_student_no_skipped_jobs_occ1990dd \
  --arch transformer_lm_gpt \
  --optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 \
  --clip-norm 0.0 \
  --lr 0.0005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
  --warmup-init-lr 1e-07 \
  --tokens-per-sample 512 --sample-break-mode eos \
  --max-tokens 16000 --update-freq 1 \
  --max-update 85000 \
  --save-dir /oak/stanford/groups/athey/laborai/Zippia/checkpoints/$NAME \
  --tensorboard-logdir ~/FOW_2.0/src/fairseq/labor-logs/$NAME \
  --no-epoch-checkpoints  --save-interval-updates 1000 \
  --two-stage  --year-embeddings --ethnicity-embeddings \
  --gender-embeddings  --state-embeddings --education-embeddings \
  --fp16  --decoder-layers 12  --decoder-embed-dim 192 \
  --decoder-ffn-embed-dim 768 --decoder-attention-heads 3 \
  --skip-gender  --skip-ethnicity