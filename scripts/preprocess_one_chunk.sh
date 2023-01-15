#!/bin/sh
#
#SBATCH -c 8
#SBATCH -t 2:15:00
#SBATCH --mail-user=keyvafa@gmail.com
#SBATCH --mail-type=FAIL

python ~/FOW_2.0/src/setup/preprocess_zippia_subsample.py  \
  --zippia_index=${ZIPPIA_INDEX}  