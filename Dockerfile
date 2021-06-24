FROM ubuntu:16.04
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

MAINTAINER priscila pmoreira@nd.edu

RUN apt-get update && apt-get install -y \
  python3-pip \
  build-essential \
  cmake git vim libgl1-mesa-dev libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
  python3-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

ENV PYTHONWARNINGS=ignore:DEPRECATION

RUN pip3 install --upgrade 'pip<21' 'setuptools<51'
RUN pip3 install pyyaml \
  numpy==1.18 \
  Pillow==3.2.0 \
  scipy==1.1.0 \
  tensorflow-gpu==0.12.1 \
  easydict \
  matplotlib \
  Cython \
  Image \
  opencv-python \
  networkx==2.1 \
  scikit-image


RUN export CUDA_HOME=/usr/local/cuda
RUN export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
RUN PATH=${CUDA_HOME}/bin:${PATH}
RUN export PATH

RUN ln -s /usr/local/cuda/lib64/libcudart.so /usr/local/lib/
RUN ln -s /usr/local/cuda/lib64/libcudart.a /usr/local/lib/

RUN alias python='python3.5'
RUN alias python3='python3.5'
