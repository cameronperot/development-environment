# https://github.com/devcontainers/images/tree/main/src/miniconda
FROM mcr.microsoft.com/devcontainers/miniconda:latest

# switch to the root user
USER root

# set environment variables
ENV TERM=xterm-256color

# update and upgrade packages
RUN apt-get update \
    && apt-get upgrade -y

# install new packages
RUN apt-get install -y software-properties-common \
    && apt-add-repository contrib \
    && apt-add-repository non-free \
    && apt-get update \
    && apt-get install -y \
        build-essential \
        ca-certificates \
        curl \
        fontconfig \
        git \
        gnupg \
        htop \
        ttf-mscorefonts-installer


# run setup scripts
RUN git clone https://github.com/cameronperot/shell-scripts.git /tmp/shell-scripts \
    && cd /tmp/shell-scripts/setup-scripts \
    && ./ta-lib.sh \
    && rm -rf /tmp/shell-scripts

# install Python packages and clean up temp files after
COPY environment.yml /tmp/environment.yml
RUN conda update -n base conda \
    && /opt/conda/bin/conda env update -n base -f /tmp/environment.yml \
    && conda clean --all -y \
    && pip cache purge

# create the dev user
ARG NEW_USER=dev
RUN useradd -ms /usr/bin/zsh ${NEW_USER} \
    && usermod -aG conda ${NEW_USER}

# configure the root user's environment
RUN git clone https://github.com/cameronperot/environment-setup.git /tmp/environment-setup \
    && /tmp/environment-setup/install.py --extract-appimage \
    && sed -i "s@let g:python3_host_prog.*@let g:python3_host_prog = '/opt/conda/bin/python'@g" /root/.config/nvim/init.vim \
    && rm -rf /tmp/environment-setup

# copy jupyter config files
COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY ./jupyter_notebook_config.py /home/${NEW_USER}/.jupyter/jupyter_notebook_config.py

# set the working directory and switch to the dev user
WORKDIR /home/${NEW_USER}
RUN chown -R ${NEW_USER}:${NEW_USER} /home/${NEW_USER}
USER ${NEW_USER}

# configure the dev user's environment
RUN git clone https://github.com/cameronperot/environment-setup.git /tmp/environment-setup \
    && /tmp/environment-setup/install.py --extract-appimage \
    && sed -i "s@let g:python3_host_prog.*@let g:python3_host_prog = '/opt/conda/bin/python'@g" /home/${NEW_USER}/.config/nvim/init.vim \
    && rm -rf /tmp/environment-setup

# set the entrypoint
ENTRYPOINT ["jupyter", "lab"]
