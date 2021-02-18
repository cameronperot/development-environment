#!/bin/bash
set -eu -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P)"

sudo dnf install \
    libatomic \
    python \
    gfortran \
    perl \
    wget \
    m4 \
    cmake \
    pkg-config

setup_dir=$PWD
cd $HOME
git clone git://github.com/JuliaLang/julia.git
git checkout v1.5.3
make

sudo dnf install hdf5-devel
$HOME/julia/julia $DIR/julia-setup.jl
