#!/bin/bash
set -eu -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P)"

install_dir=$HOME
rm -rf $install_dir
mkdir $install_dir

version_major=1
version_minor=5
version_patch=3
version=$version_major.$version_minor.$version_patch

url=https://julialang-s3.julialang.org/bin/linux/x64/$version_major.$version_minor/julia-$version-linux-x86_64.tar.gz
file=/tmp/julia-$version-linux-x86_64.tar.gz

wget -O $file $url
tar --directory $install_dir -xf $file

sudo dnf install hdf5-devel
$install_dir/julia-$version/bin/julia $DIR/julia-setup.jl
