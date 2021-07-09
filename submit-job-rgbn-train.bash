qsub \
-N rgbn-train \
-o output-rgbn-train.txt \
-q gpu \
-l gpu_card=1 \
run-gpu-singularity.bash \
./train_faster_rcnn.sh 0 coco res101_fusion EXP_DIR coco_flip_0001_bilinear_new

