#! /bin/bash

volumes=$(docker volume ls)
if [[ "$volumes" != *"oracle"* ]]; then
    docker volume rm oracle
    docker volume create oracle
fi

# docker run -d --name oracle \
#     -p 1521:1521 \
#     --ulimit nofile=1024:65536 --ulimit nproc=2047:16384 --ulimit stack=10485760:33554432 --ulimit memlock=3221225472 \
#     -e ORACLE_SID=orcl \
#     -e ORACLE_PDB=motde \
#     -e ORACLE_PWD=MOTDE2017 \
#     -e ORACLE_CHARACTERSET=AL32UTF8 \
#     -e ENABLE_ARCHIVELOG=true \
#     -e ENABLE_FORCE_LOGGING=true \
#     -e ENABLE_TCPS=true \
#     -v oracle=/opt/oracle/oradata \
#     oracle/database:12.1.0.2-ee


docker run -d --name oracle \
    -p 1521:1521 \
    -e ORACLE_SID=orcl \
    -e ORACLE_PDB=motde \
    -e ORACLE_PWD=MOTDE2017 \
    -e ORACLE_CHARACTERSET=AL32UTF8 \
    -e ENABLE_ARCHIVELOG=true \
    -e ENABLE_FORCE_LOGGING=true \
    -e ENABLE_TCPS=true \
    -v oracle=/opt/oracle/oradata \
    oracle/database:12.1.0.2-ee
