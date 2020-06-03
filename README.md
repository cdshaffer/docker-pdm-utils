# docker-pdm-utils

This is project to create a pdm-utils docker image.

It currently uses a miniconda3 base image and builds the mysql service using most of the Dockerfile from 
[mysql version 5.7](https://github.com/docker-library/mysql/tree/master/5.7). It then downloads, builds and installs mmseqs2, Aragorn, tRNAscan-SE, and infernal. It is missing installation of the optional NCBI executables (Blast+, Conserved Domain Database, or Lecacy Blast_.

The best instructions for installation and management of the Mysql database can be found at {https://hub.docker.com/_/mysql]{https://hub.docker.com/_/mysql} for background on Mysql management and at [https://pdm-utils.readthedocs.io/en/latest/installation.html{https://pdm-utils.readthedocs.io/en/latest/installation.html} for specifics on setting up and installing the phage database.

WARNING: This is a work in progress.
