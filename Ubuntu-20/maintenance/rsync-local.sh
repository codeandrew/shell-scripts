#!/bin/bash


# NOTES:
# Batch Files: If there are many small files, 
# consider using --files-from to list the files you want to copy, 
# so rsync reads the list once and performs the operation.

# --inplace: This option will update destination files in-place, reducing I/O operations
# Experiment with the --block-size option to see if larger or smaller block sizes make a difference

# RUN Multiple RSYNC Operations if there's many as 
source_path=/tmp/copy
destination=/media/


# FRESH COPY 
rsync -av \
      --inplace \
      --whole-file \
      --ignore-existing  \
      $source_path $destination_path


# CONTINUE PREVIOS COPY
# rsync -av \
#       --inplace \
#       $source_path $destination_path
