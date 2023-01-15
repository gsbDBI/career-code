#!/bin/sh
#
#SBATCH -c 16
#SBATCH -t 1:00:00
#SBATCH --mem-per-cpu 32G
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --partition=bigmem

TEXT=/oak/stanford/groups/athey/laborai/Zippia/fairseq_input_final_one_job_year_with_unemployment
DEST_DIR=/oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_final_one_job_year_with_unemployment
fairseq-preprocess \
    --only-source \
    --trainpref $TEXT/train.tok \
    --validpref $TEXT/valid.tok \
    --testpref $TEXT/test.tok \
    --destdir $DEST_DIR/input \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $TEXT/train.year \
    --validpref $TEXT/valid.year \
    --testpref $TEXT/test.year \
    --destdir $DEST_DIR/year \
    --workers 60


fairseq-preprocess \
    --only-source \
    --trainpref $TEXT/train.ethnicity \
    --validpref $TEXT/valid.ethnicity \
    --testpref $TEXT/test.ethnicity \
    --destdir $DEST_DIR/ethnicity \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $TEXT/train.gender \
    --validpref $TEXT/valid.gender \
    --testpref $TEXT/test.gender \
    --destdir $DEST_DIR/gender \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $TEXT/train.state \
    --validpref $TEXT/valid.state \
    --testpref $TEXT/test.state \
    --destdir $DEST_DIR/state \
    --workers 60

fairseq-preprocess \
    --only-source \
    --trainpref $TEXT/train.education \
    --validpref $TEXT/valid.education \
    --testpref $TEXT/test.education \
    --destdir $DEST_DIR/education \
    --workers 60