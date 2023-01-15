#!/bin/sh
#
#SBATCH -c 16
#SBATCH -t 1:00:00
#SBATCH --mem-per-cpu 32G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=bigmem

DATA_DIR=/oak/stanford/groups/athey/laborai/Zippia/fairseq_input_forecast_final_one_job_year_with_unemployment
DEST_DIR=/oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_forecast_final_one_job_year_with_unemployment

## Create dictionary for year, and then order it
fairseq-preprocess \
    --only-source \
    --trainpref $DATA_DIR/all.year \
    --validpref $DATA_DIR/valid.year \
    --testpref $DATA_DIR/test.year \
    --destdir $DEST_DIR/year \
    --dict-only \
    --workers 60

## Order the year dictionary.
python ~/FOW_2.0/src/setup/create_ordered_dictionary.py  \
  --data_dir=${DEST_DIR}  

fairseq-preprocess \
  --only-source \
  --trainpref $DATA_DIR/train.tok \
  --validpref $DATA_DIR/valid.tok \
  --testpref $DATA_DIR/test.tok \
  --destdir $DEST_DIR/input \
  --workers 60


fairseq-preprocess \
    --only-source \
    --trainpref $DATA_DIR/train.year \
    --validpref $DATA_DIR/valid.year \
    --testpref $DATA_DIR/test.year \
    --srcdict $DEST_DIR/year/dict.txt \
    --destdir $DEST_DIR/year \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $DATA_DIR/train.ethnicity \
    --validpref $DATA_DIR/valid.ethnicity \
    --testpref $DATA_DIR/test.ethnicity \
    --destdir $DEST_DIR/ethnicity \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $DATA_DIR/train.gender \
    --validpref $DATA_DIR/valid.gender \
    --testpref $DATA_DIR/test.gender \
    --destdir $DEST_DIR/gender \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $DATA_DIR/train.state \
    --validpref $DATA_DIR/valid.state \
    --testpref $DATA_DIR/test.state \
    --destdir $DEST_DIR/state \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $DATA_DIR/train.education \
    --validpref $DATA_DIR/valid.education \
    --testpref $DATA_DIR/test.education \
    --destdir $DEST_DIR/education \
    --workers 60