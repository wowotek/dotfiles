#!/bin/bash

rm /etc/apt/sources.list.d/cuda*
apt remove nvidia-cuda-toolkit -y
apt remove nvidia-* -y
apt update
add-apt-repository ppa:graphics-drivers/ppa -y

apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'

apt update
apt install cuda-10-0
apt install libcudnn7

echo "# set PATH for cuda 10.0 installation" >> ~/.profile
echo "if [ -d "/usr/local/cuda-10.0/bin/" ]; then" >> ~/.profile
echo "    export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}" >> ~/.profile
echo "    export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.profile
echo "fi" >> ~/.profile

reboot
