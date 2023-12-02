# Python Development Image
This OCI image is intended to serve as a base image to create Python development containers.
The advantage of using an image for development is that it's portable and can easily be spun up anywhere with an OCI host such as Docker or Podman.

## Building
To build the image with `docker`, run
```bash
docker build --tag python-dev:latest .
```

## Running
To run a container based on the image, run
```bash
docker run --name python_dev --restart always --publish 127.0.0.1:8888:8888 --detach localhost/python-dev:latest
```
or alternatively using the `compose.yml` file
```bash
docker compose -f compose.yml up
```
