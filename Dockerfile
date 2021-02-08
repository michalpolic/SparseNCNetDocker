FROM nvidia/cuda:11.0-devel

ENV TZ=Europe/Prague
ENV CUDA_HOME="/usr/local/cuda11.0"
ENV FORCE_CUDA="1"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y cmake libeigen3-dev libboost-all-dev

RUN apt-get install -y git build-essential linux-libc-dev
#RUN apt-get install -y cmake cmake-gui 
#RUN apt-get install -y libusb-dev libudev-dev
#RUN apt-get install -y mpi-default-dev openmpi-bin openmpi-common 

#RUN apt-get install -y libpcap-dev
#RUN apt-get install -y libflann-dev
#RUN apt-get install -y libopenni2-dev
#RUN apt-get install -y libqhull7 libqhull-dev 

#RUN apt-get install -y freeglut3-dev pkg-config
#RUN apt-get install -y libxmu-dev libxi-dev 
#RUN apt-get install -y mono-complete
#RUN apt-get install -y openjdk-8-jdk openjdk-8-jre

#RUN apt-get install -y libpcl-dev

RUN apt-get install -y libopenblas-dev \
    && apt-get install -y libgl1-mesa-glx \
    && apt-get install -y wget \
    && apt-get install -y unzip \
    && apt-get install -y python3-pip \
    && pip3 install numpy \
    && pip3 install scipy \
    && pip3 install matplotlib \
    && pip3 install open3d \
    && pip3 install tensorboardX \
    && pip3 install future-fstrings \
    && pip3 install easydict \
    && pip3 install joblib \
    && pip3 install scikit-learn \
    && pip3 install torch \
    && pip3 install torchvision

RUN ln -s /usr/bin/python3.8 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip

#funguje ale moc nove: 
RUN echo "alias pip=pip3" >>  ~/.bashrc && echo "alias python=python3" >>  ~/.bashrc && pip3 install -U MinkowskiEngine --install-option="--blas=openblas" -v      
#RUN echo "alias pip=pip3" >>  ~/.bashrc && echo "alias python=python3" >>  ~/.bashrc && git clone -b mink-0.4.2-pytorch-1.4 https://github.com/StanfordVL/MinkowskiEngine.git && cd MinkowskiEngine && export PATH=/usr/local/cuda-11.1/bin${PATH:+:${PATH}} && export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} && python3 setup.py install

#nefunguje:
#RUN echo "alias pip=pip3" >>  ~/.bashrc && echo "alias python=python3" >>  ~/.bashrc && pip3 install git+https://github.com/NVIDIA/MinkowskiEngine.git@v0.5

#RUN export CXX=g++-7
#RUN echo "alias pip=pip3" >>  ~/.bashrc && echo "alias python=python3" >>  ~/.bashrc \
#    && pip3 install git+https://github.com/NVIDIA/MinkowskiEngine.git@v0.5 --install-option="--blas=openblas"
#
#ADD requirementsFCGF.txt .
#RUN pip3 install -r requirementsFCGF.txt 

#RUN cd home && git clone https://github.com/MIT-SPARK/TEASER-plusplus.git && cd TEASER-plusplus && mkdir build && cd build && cmake .. && make && ctest && make instal#l

#RUN cd home && cd TEASER-plusplus && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DTEASERPP_PYTHON_VERSION=3.6 .. && make teaserpp_python -j4 && cd python && pip3 install .

#CMD python "teaserpp.py"
CMD bash