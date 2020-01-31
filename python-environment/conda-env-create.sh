#!/bin/bash
set -e

# create a new conda environment
conda create -n $1 python

# create files to set when activating/deactivating the environment
env_dir=/opt/miniconda3/envs/$1
mkdir -p $env_dir/etc/conda/activate.d
mkdir -p $env_dir/etc/conda/deactivate.d
touch $env_dir/etc/conda/activate.d/env_vars.sh
touch $env_dir/etc/conda/deactivate.d/env_vars.sh

# set activation of environment variables
cat <<EOT > $env_dir/etc/conda/activate.d/env_vars.sh
export ENV_VAR_1=VALUE_1
export ENV_VAR_2=VALUE_2
EOT

# set deactivation of environment variables
cat <<EOT > $env_dir/etc/conda/deactivate.d/env_vars.sh
unset ENV_VAR_1
unset ENV_VAR_2
EOT
