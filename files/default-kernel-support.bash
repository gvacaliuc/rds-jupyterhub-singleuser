#   Addons to rds-jupyterhub-singleuser /etc/profile

CLING_ENV_DIR=/opt/conda/envs/cling
if [[ -d $CLING_ENV_DIR ]]
then
    export PATH=$PATH:$CLING_ENV_DIR
fi
