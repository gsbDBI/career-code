# #!/bin/sh
# #
# #SBATCH -c 16
# #SBATCH -t 1:00:00
# #SBATCH --mem-per-cpu 32G
# #SBATCH --mail-user=keyvafa@gmail.com
# #SBATCH --mail-type=ALL
# #SBATCH --partition=bigmem

# ZIPPIA_DIR=/oak/stanford/groups/athey/laborai/Zippia/fairseq_input_final_one_job_year_with_unemployment_nilf_student_no_skipped_jobs_occ1990dd
# FAIRSEQ_DIR=/oak/stanford/groups/athey/laborai/Zippia/fairseq_data_bin/zippia_final_one_job_year_with_unemployment_nilf_student_no_skipped_jobs_occ1990dd

# fairseq-preprocess \
#   --only-source \
#   --trainpref $ZIPPIA_DIR/all.tok \
#   --validpref $ZIPPIA_DIR/valid.tok \
#   --testpref $ZIPPIA_DIR/test.tok \
#   --destdir $FAIRSEQ_DIR/input \
#   --dict-only \
#   --workers 60

# fairseq-preprocess \
#   --only-source \
#   --trainpref $ZIPPIA_DIR/train.tok \
#   --validpref $ZIPPIA_DIR/valid.tok \
#   --testpref $ZIPPIA_DIR/test.tok \
#   --srcdict $FAIRSEQ_DIR/input/dict.txt \
#   --destdir $FAIRSEQ_DIR/input \
#   --workers 60


# fairseq-preprocess \
#     --only-source \
#     --trainpref $ZIPPIA_DIR/train.year \
#     --validpref $ZIPPIA_DIR/valid.year \
#     --testpref $ZIPPIA_DIR/test.year \
#     --destdir $FAIRSEQ_DIR/year \
#     --workers 60

# fairseq-preprocess \
#     --only-source \
#     --trainpref $ZIPPIA_DIR/train.ethnicity \
#     --validpref $ZIPPIA_DIR/valid.ethnicity \
#     --testpref $ZIPPIA_DIR/test.ethnicity \
#     --destdir $FAIRSEQ_DIR/ethnicity \
#     --workers 60

# fairseq-preprocess \
#     --only-source \
#     --trainpref $ZIPPIA_DIR/train.gender \
#     --validpref $ZIPPIA_DIR/valid.gender \
#     --testpref $ZIPPIA_DIR/test.gender \
#     --destdir $FAIRSEQ_DIR/gender \
#     --workers 60

# fairseq-preprocess \
#     --only-source \
#     --trainpref $ZIPPIA_DIR/train.state \
#     --validpref $ZIPPIA_DIR/valid.state \
#     --testpref $ZIPPIA_DIR/test.state \
#     --destdir $FAIRSEQ_DIR/state \
#     --workers 60

# fairseq-preprocess \
#     --only-source \
#     --trainpref $ZIPPIA_DIR/train.education \
#     --validpref $ZIPPIA_DIR/valid.education \
#     --testpref $ZIPPIA_DIR/test.education \
#     --destdir $FAIRSEQ_DIR/education \
#     --workers 60