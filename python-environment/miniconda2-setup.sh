#!/bin/bash
set -e

# Setting up the miniconda directory
install_dir=/opt/miniconda2
conda_url=https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
sudo mkdir $install_dir
sudo chown $USER:$USER $install_dir

# Download and run the installer
cd $install_dir
sudo wget -O miniconda.sh $conda_url
bash miniconda.sh -b -f -p $install_dir
