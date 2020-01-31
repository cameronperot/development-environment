#!/bin/bash
set -e

# Set variables
conda_dir=/opt/miniconda3
dir=$PWD
export PATH=$conda_dir/bin:$PATH

# Create and activate conda environment
conda env create -f $dir/env-jupyter.yml
source activate jupyter

# Install extensions for jupyterlab
jupyter labextension install \
    jupyterlab_bokeh \
    jupyterlab-drawio \
    @jupyterlab/latex \
    jupyter-matplotlib \
    @jupyterlab/github \
    @jupyterlab/toc \
    @jupyter-widgets/jupyterlab-manager \
    @lckr/jupyterlab_variableinspector

# Set up /etc/jupyter
sudo mkdir /etc/jupyter
sudo groupadd jupyter
sudo usermod -a -G jupyter $USER
sudo chgrp -R jupyter /etc/jupyter
sudo chmod g+s /etc/jupyter
sudo openssl req -newkey rsa:2048 -nodes -keyout /etc/jupyter/jupyter.key -x509 -days 365 -out /etc/jupyter/jupyter.crt
sudo cp $dir/jupyter-configs/*_config.py /etc/jupyter/
sudo chmod 750 /etc/jupyter
sudo chmod 640 /etc/jupyter/jupyter.key
sudo chmod 640 /etc/jupyter/jupyter.crt

# Enable the service
sudo cp $dir/jupyter-configs/jupyter.service /usr/lib/systemd/system/jupyter.service
sudo systemctl daemon-reload
sudo systemctl enable jupyter.service
sudo systemctl start jupyter.service
