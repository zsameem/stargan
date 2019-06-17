# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# pytorch       latest (pip)
# ==================================================================

FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
ENV LANG C.UTF-8
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \
    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        apt-utils \
        ca-certificates \
        wget \
        git \
        vim \
        && \

# ==================================================================
# python
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.6 \
        python3.6-dev \
        python3-distutils-extra \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    $PIP_INSTALL \
        setuptools \
        && \
    $PIP_INSTALL \
        numpy \
        scipy \
        pandas \
        scikit-learn \
        matplotlib \
        Cython \
        && \

# ==================================================================
# pytorch and tf
# ------------------------------------------------------------------

    $PIP_INSTALL \
        absl-py==0.7.1 \
        astor==0.8.0 \
        gast==0.2.2 \
        grpcio==1.21.1 \
        h5py==2.9.0 \
        Keras-Applications==1.0.8 \
        Keras-Preprocessing==1.1.0 \
        Markdown==3.1.1 \
        mock==3.0.5 \
        numpy==1.16.4 \
        Pillow==6.0.0 \
        protobuf==3.8.0 \
        six==1.12.0 \
        tensorboard==1.13.1 \
        tensorflow==1.13.1 \
        tensorflow-estimator==1.13.0 \
        termcolor==1.1.0 \
        torch==1.1.0 \
        torchvision==0.3.0 \
        Werkzeug==0.15.4 \
        && \

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*
