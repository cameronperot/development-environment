#!/bin/bash
set -eu -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P)"
JULIA_VERSION="1.9.3"

sudo dnf install \
    libatomic \
    python \
    gfortran \
    perl \
    wget \
    m4 \
    cmake \
    hdf5-devel \
    pkg-config

cd /opt/julia
git clone https://github.com/JuliaLang/julia.git "julia-$JULIA_VERSION"
cd "julia-$JULIA_VERSION"
git checkout "v$JULIA_VERSION"
make -j8

"/opt/julia/julia-$JULIA_VERSION/julia" $DIR/julia-setup.jl
