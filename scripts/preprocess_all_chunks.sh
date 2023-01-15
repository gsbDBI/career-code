#!/bin/sh

for ZIPPIA_INDEX in {0..100}; do
  export ZIPPIA_INDEX=${ZIPPIA_INDEX}
  sbatch --job-name=${ZIPPIA_INDEX}_preprocess \
         ~/FOW_2.0/src/scripts/preprocess_one_chunk.sh
done