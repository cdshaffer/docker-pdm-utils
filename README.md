# docker-pdm-utils

This is project to create a pdm-utils docker image.

It currently uses a miniconda3 base image and builds the mysql service using most of the Dockerfile from 
[mysql version 5.7](https://github.com/docker-library/mysql/tree/master/5.7). 
It then downloads, builds and installs 
[MMseqs2](https://github.com/soedinglab/mmseqs2), 
[Aragorn](http://130.235.244.92/ARAGORN/), 
[tRNAscan-SE](http://trna.ucsc.edu/), 
[and infernal](http://eddylab.org/infernal/). 
It is missing installation of the optional NCBI executables (Blast+, Conserved Domain Database, or Lecacy Blast) 
so detection and curation of conserved domains is not supported. 

The best instructions for initial installation and management of the MySQL database can be found at 
[the Docker Hub MySQL page](https://hub.docker.com/_/mysql); specific instructions related to installation of
a specific phage database can be found on the 
 [the pdm utils installation pages](https://pdm-utils.readthedocs.io/en/latest/installation.html).

WARNING: This is a work in progress. TODO: 

+separate build machine from final pdm image to help with image size 
see [this](https://forums.docker.com/t/best-practices-for-git-clone-make-etc-via-dockerfile-run/79152) and 
[this](https://docs.docker.com/develop/develop-images/multistage-build/). 

+[Add pdm_utils repository to add the special files not included with the pip install. ](https://pdm-utils.readthedocs.io/en/latest/installation/install_pdm_utils_repo.html#install-pdm-utils-repo).
