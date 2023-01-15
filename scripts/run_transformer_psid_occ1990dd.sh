# #!/bin/sh
# #
# #SBATCH -t 12:00:00
# #SBATCH -c 8
# #SBATCH -C GPU_MEM:32GB
# #SBATCH --gpus 1
# #SBATCH --mem-per-cpu 8G
# #SBATCH --mail-user=keyvafa@gmail.com
# #SBATCH --mail-type=ALL
# #SBATCH --partition=athey

# NAME=occ1990dd_for_psid_transformer_final_one_job_year_year_eth_gender_embeds
# python ~/FOW_2.0/src/fairseq/train.py --task labor_modeling \
#   /oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_final_one_job_year_with_unemployment_nilf_student_no_skipped_jobs_occ1990dd \
#   --arch transformer_lm_gpt \
#   --optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 \
#   --clip-norm 0.0 \
#   --lr 0.0005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
#   --warmup-init-lr 1e-07 \
#   --tokens-per-sample 512 --sample-break-mode eos \
#   --max-tokens 16000 --update-freq 1 \
#   --max-update 1000000 \
#   --save-dir /oak/stanford/groups/athey/laborai/Zippia/checkpoints/$NAME \
#   --tensorboard-logdir ~/FOW_2.0/src/fairseq/labor-logs/$NAME \
#   --no-epoch-checkpoints  --save-interval-updates 1000 \
#   --two-stage  --year-embeddings --ethnicity-embeddings \
#   --gender-embeddings