FROM nvidia/cudagl:10.2-devel-ubuntu18.04
MAINTAINER geesara <ggeesara@gmail.com>


############################################
# Basic dependencies
############################################
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && apt-get install -y -q
RUN apt-get update --fix-missing && apt-get install -y dialog apt-utils
RUN apt-get update --fix-missing && apt-get install -y \
      python3-numpy python3-matplotlib python3-dev \
      python3-opengl python3-pip \
      cmake zlib1g-dev libjpeg-dev xvfb  \
      xorg-dev libboost-all-dev libsdl2-dev swig \
      git wget openjdk-8-jdk ffmpeg unzip\
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*


############################################
# Change the working directory
############################################
WORKDIR /opt


############################################
# OpenAI Gym
############################################
RUN pip3 install --upgrade pip
RUN pip3 install h5py future pyvirtualdisplay 'gym[atari]' 'gym[box2d]' 'gym[classic_control]' opencv-python


############################################
# PyTorch and Tensorflow
############################################
RUN pip3 install torch torchvision tensorflow==1.14 pandas filelock


############################################
# PyBullet
############################################
RUN pip3 install pybullet
# RUN sed -i 's/robot_bases/pybullet_envs.robot_bases/' /usr/local/lib/python3.5/dist-packages/pybullet_envs/robot_locomotors.py



############################################
# EvoRobotPy
############################################
RUN apt-get update && apt-get install libgsl0-dev -y
RUN pip3 install pyglet Cython
RUN git clone https://github.com/snolfi/evorobotpy2.git

# EvoNet, ErDiscrim, ErPredPrey, and ErDpole Setup
RUN cd evorobotpy2/lib/ \
    && chmod +x *.sh \
    && ./compilenet.sh \
    && ./compilediscrim.sh \
    && ./compilepredprey.sh \
    && ./compiledpole.sh \ 
    && ./compilestaybehind.sh \
    && cp *.so ../bin

############################################
# Installing Environments 
############################################
RUN cd evorobotpy2/pybullet && echo "$(echo -n '#'; cat init.py)" > init.py \
    && sed -i -z 's/$/\n/g' /usr/local/lib/python3.6/dist-packages/pybullet_envs/__init__.py \
    && cat init.py >> /usr/local/lib/python3.6/dist-packages/pybullet_envs/__init__.py \
    && cp gym_locomotion_envs2.py robot_locomotors.py /usr/local/lib/python3.6/dist-packages/pybullet_envs/

############################################
# Jupyter Notebook
############################################
RUN pip3 install notebook

############################################
# Deep Reinforcement Learning
#    OpenAI Baselines
############################################
# Need to remove mujoco dependency from baselines
RUN git clone https://github.com/openai/baselines.git \
    && sed --in-place 's/mujoco,//' baselines/setup.py \
    && cd baselines && pip3 install -e . \
    && pip3 install mpi4py cloudpickle