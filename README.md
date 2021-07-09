# Running the RGB-N code on the CRC GPUs using singularity

## Download the Singularity image to your `/scratch365` directory. 

*The image file `.sif` must be stored on the scratch365 device for Singularity to work on CRC*
```
singularity pull /scratch365/$USER/rgbn.sif library://psaboia/default/rgb-n:version-1
```

## Download the code to your home directory
```
git clone https://github.com/psaboia/RGB-N.git ~/rgbn
```

## Download the pre-trained model
For ImageNet resnet101 pre-trained model, please download from http://www.crc.nd.edu/~pmoreira/rgbn/imagenet_weights_res101.tar.gz
```
cd ~/rgbn
wget http://www.crc.nd.edu/~pmoreira/rgbn/imagenet_weights_res101.tar.gz 
tar -xvzf imagenet_weights_res101.tar.gz
rm  imagenet_weights_res101.tar.gz
```

## Download the synthetic dataset and training/testing split
```
cd ~/rgbn
wget http://www.crc.nd.edu/~pmoreira/rgbn/coco_synthetic_v0.tar.gz
tar -xvzf coco_synthetic_v0.tar.gz
rm coco_synthetic_v0.tar.gz
```


## For training on synthetic dataset
Change the coco synthetic path in `lib/datasets/factory.py` line `61` :
```
...
 61 coco_path='/afs/crc.nd.edu/user/p/pmoreira/rgbn/datasets/coco_synthetic_v0'
 62 for split in ['coco_train_filter_single', 'coco_test_filter_single']:
 63     name = split
 64     __sets[name] = (lambda split=split: coco(split,2007,coco_path))
...
```
Then, submit a job to run this program on the GPU queue. For convenience, I've included a script to run the submission command.
 ```
 bash submit-job-rgbn-train.bash
 ```
 This way to submit job scripts to CRC using Singularity is based on this tutorial https://github.com/bdusell/singularity-tutorial.git

# RGB-N original source
CVPR 2018 paper "Learning Rich Features for Image Manipulation Detection" 
https://github.com/pengzhou1108/RGB-N.git

