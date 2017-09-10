#  Single-user image for Rice DataSci Club's JupyterHub
FROM jupyter/all-spark-notebook

MAINTAINER Gabe Vacaliuc <gv8@rice.edu>

USER root
COPY files/fix-permissions /usr/local/bin/fix-permissions
COPY files/start-singleuser.sh /usr/local/bin/start-singleuser.sh
RUN chmod 775 /usr/local/bin/start-singleuser.sh

#   Add some nbconvert templates from the repo.
RUN mkdir -p /home/$NB_USER/.jupyter/nbconvert-templates 
COPY files/nbconvert-templates /home/jovyan/.jupyter/nbconvert-templates

#   fix permissions for jupyter directory
RUN fix-permissions /home/$NB_USER/.jupyter

#   Add cling environment
RUN mkdir -p /opt/conda/environment-specs
COPY files/conda-envs/cling-environment.yml /opt/conda/environment-specs/cling-environment.yml
#   Add more environments here

#
RUN fix-permissions /opt/conda/environment-specs

#   Updates the user's $PATH to include some environments to load as default
COPY files/default-kernel-support.bash /etc/default-kernel-support.bash
RUN cat /etc/profile /etc/default-kernel-support.bash > /etc/profile

#   NOTEBOOK USER
USER $NB_USER

RUN mkdir -p /home/$NB_USER/.bash
COPY files/bash /home/$NB_USER/.bash
RUN /bin/bash -c "pushd /home/$NB_USER/; rm .bashrc; ln -s .bash/.bashrc .bashrc; popd"
