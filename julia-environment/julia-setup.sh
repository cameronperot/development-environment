#!/bin/bash
set -eu -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P )"

INSTALL_DIR=/opt/julia
sudo rm -rf ${INSTALL_DIR}
sudo mkdir ${INSTALL_DIR}
sudo chown ${USER}:${USER} ${INSTALL_DIR}

VERSION=${1}.${2}.${3}

URL=https://julialang-s3.julialang.org/bin/linux/x64/${1}.${2}/julia-${VERSION}-linux-x86_64.tar.gz
FILE=/tmp/julia-${VERSION}-linux-x86_64.tar.gz

wget -O ${FILE} ${URL}
tar --directory ${INSTALL_DIR} -xf ${FILE}

sudo dnf install hdf5-devel
${INSTALL_DIR}/julia-${VERSION}/bin/julia ${DIR}/julia-setup.jl

cd ${INSTALL_DIR}/julia-${VERSION}
cp -a ${DIR}/precompile_plots*.jl ./
./bin/julia precompile_plots_image.jl
