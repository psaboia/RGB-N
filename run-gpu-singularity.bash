#!/bin/bash

export CUDA_VISIBLE_DEVICES=${SGE_HGR_gpu_card}
export SINGULARITYENV_CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES}
echo "Running on host $HOSTNAME"

echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
echo "nvidia-smi output:"
nvidia-smi

singularity exec --nv /scratch365/$USER/rgbn.sif "$@"
