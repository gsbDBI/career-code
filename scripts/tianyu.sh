RESUME_DATA_DIR=/home/tianyudu/Data/fairseq_input_downsampled_resumes_occ1990dd_20000
BINARY_DATA_DIR=/home/tianyudu/Data/fairseq_bin

# preprocessing.
# sh preprocess/preprocess_resumes.sh $RESUME_DATA_DIR $BINARY_DATA_DIR

SAVE_DIR=/home/tianyudu/Data/cache
LOG_DIR=/home/tianyudu/Data/cache

fairseq-train --task occupation_modeling \
  $BINARY_DATA_DIR/resumes \
  --arch career \
  --optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 \
  --clip-norm 0.0 \
  --lr 0.0005 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
  --warmup-init-lr 1e-07 \
  --tokens-per-sample 512 --sample-break-mode eos \
  --max-tokens 16000 --update-freq 1 \
  --max-update 50000 --save-interval-updates 1000 \
  --save-dir $SAVE_DIR/resumes/career \
  --tensorboard-logdir $LOG_DIR/resumes/career \
  --fp16 --two-stage \
  --include-year --include-education --include-location
