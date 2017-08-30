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

RUN fix-permissions /home/$NB_USER/.jupyter

CMD start-singleuser.sh
