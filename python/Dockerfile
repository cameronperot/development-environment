FROM continuumio/miniconda3 as conda_source
FROM debian:bookworm

# set environment variables
ENV TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    PATH=/opt/conda/bin:$PATH

# update and upgrade packages
RUN apt-get update \
    && apt-get upgrade -y

# copy over conda files
RUN groupadd -g 1100 conda
COPY --chown=:conda --chmod=775 --from=conda_source /opt/conda /opt/conda
RUN chmod =2775 /opt/conda \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

# install new packages
RUN echo "deb http://deb.debian.org/debian bookworm contrib non-free" > /etc/apt/sources.list.d/contrib.list \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        bzip2 \
        ca-certificates \
        curl \
        fontconfig \
        git \
        gnupg \
        htop \
        iputils-ping \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        netbase \
        openssh-client \
        procps \
        rsync \
        sudo \
        ttf-mscorefonts-installer \
        wget \
        zsh \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*

# run setup scripts
RUN git clone https://github.com/cameronperot/shell-scripts.git /tmp/shell-scripts \
    && cd /tmp/shell-scripts/setup-scripts \
    && ./ta-lib.sh \
    && rm -rf /tmp/shell-scripts

# create the new user
ARG NEW_USER=dev
RUN groupadd -g 1001 ${NEW_USER} \
    && useradd -u 1001 -g 1001 -ms /usr/bin/zsh ${NEW_USER} \
    && usermod -aG conda ${NEW_USER} \
    && usermod -aG conda root

# configure the root user's environment
RUN git clone https://github.com/cameronperot/environment-setup.git /tmp/environment-setup \
    && /tmp/environment-setup/install.py --extract-appimage \
    && sed -i "s@let g:python3_host_prog.*@let g:python3_host_prog = '/opt/conda/bin/python'@g" /root/.config/nvim/init.vim \
    && rm -rf /tmp/environment-setup \
    && conda init zsh

# copy jupyter config files
COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY ./jupyter_notebook_config.py /home/${NEW_USER}/.jupyter/jupyter_notebook_config.py

# set the working directory and switch to the user
WORKDIR /home/${NEW_USER}
RUN chown -R ${NEW_USER}:${NEW_USER} /home/${NEW_USER}
USER ${NEW_USER}

# install Python packages and clean up temp files after
COPY environment.yml /tmp/environment.yml
RUN conda env update -n base -f /tmp/environment.yml \
    && conda update conda \
    && conda clean --all -y \
    && pip cache purge \
    && python -c "import matplotlib.pyplot, mlflow, numpy, pandas, seaborn"

# configure the user's environment
RUN git clone https://github.com/cameronperot/environment-setup.git /tmp/environment-setup \
    && /tmp/environment-setup/install.py --extract-appimage \
    && sed -i "s@let g:python3_host_prog.*@let g:python3_host_prog = '/opt/conda/bin/python'@g" /home/${NEW_USER}/.config/nvim/init.vim \
    && rm -rf /tmp/environment-setup \
    && conda init zsh

# set the entrypoint
ENTRYPOINT ["jupyter", "lab"]
