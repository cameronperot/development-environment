#!/bin/bash
set -eu -o pipefail

dir=$PWD
install_dir=/opt/miniconda3/envs/jupyter
version_major=1
version_minor=4
version_patch=1

version=$version_major.$version_minor.$version_patch
url=https://julialang-s3.julialang.org/bin/linux/x64/$version_major.$version_minor/julia-$version-linux-x86_64.tar.gz
file=julia-$version-linux-x86_64.tar.gz

cd $install_dir
wget -O $file $url
tar -xf $file

sudo dnf install hdf5-devel
$install_dir/julia-$version/bin/julia $dir/julia-setup.jl
