# Julia Environment

## Setup

To install Julia alongside the Python Jupyter environment run:

```bash
./julia-setup.sh
```

## Useful Notes

### Possible Required System Packages

Install before packages:

Fedora:
```bash
sudo dnf install hdf5-devel
```

Debian:
```bash
sudo aptitude install libhdf5-dev
```


### Removing Old Kernels
```bash
rm ~/.local/share/jupyter/kernels/julia-VERSION
```
