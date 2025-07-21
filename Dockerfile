FROM --platform=linux/amd64 ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && \
    apt-get install -y wget curl git build-essential mysql-server bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 && \
    apt-get clean

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda.sh && \
    bash /miniconda.sh -b -p /opt/conda && \
    rm /miniconda.sh
ENV PATH=/opt/conda/bin:$PATH

RUN /opt/conda/bin/conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
RUN /opt/conda/bin/conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

RUN /opt/conda/bin/conda create -n pdm_utils python=3.8 curl pip biopython==1.77 networkx paramiko pymysql sqlalchemy tabulate urllib3 -y && \
    /opt/conda/bin/conda clean -afy

RUN /bin/bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    conda activate pdm_utils && \
    pip install pdm_utils && \
    conda install -n pdm_utils -c bioconda aragorn infernal trnascan-se mcl blast && \
    conda install -n pdm_utils -c bioconda -c conda-forge mmseqs2=13.45111"

EXPOSE 3306

RUN mkdir -p /home/genomes
WORKDIR /home

VOLUME /var/lib/mysql

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
