# docker-pdm-utils

This is project to create a pdm-utils docker image.

It currently uses an Ubuntu 18.04 base image and builds the mysql service and sets up the conda environment.
It then downloads, builds and installs the various dependencies into the pdm_utils conda environment. 
[MMseqs2](https://github.com/soedinglab/mmseqs2), 
[Aragorn](http://130.235.244.92/ARAGORN/), 
[tRNAscan-SE](http://trna.ucsc.edu/), 
[infernal](http://eddylab.org/infernal/). 
[blast+](https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html)
and a few other low level dependencies. At this time it does not install the CDD database so the 
routines for detecting conserved domains will not work.

NOTE: This build has been tested on an arm based mac only. At this time the only tested module 
was the "file checker" routine. It has not been validated to work on phameration. This image 
relies on old code that is based on standard intel architechture. Thus it should run on any 
older intel based mac or intel based Windows machine with docker installed. 
You will need to install Rosetta 2 for this to work on an arm based mac. Other OS's might run with 
emmulation but these have not been tested.


